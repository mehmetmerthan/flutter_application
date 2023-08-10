import 'dart:io';
import 'dart:typed_data';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';
import '../models/ModelProvider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  bool _isUploading = false;
  Uint8List? myImage;
  TextEditingController aboutText = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  File? _selectedImage;
  String? myKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locale'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Profile Photo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: selectImage, // Function to pick an image
              child: CircleAvatar(
                radius: 40,
                backgroundImage:
                    _selectedImage != null ? FileImage(_selectedImage!) : null,
                child: _selectedImage == null
                    ? const Icon(Icons.add_a_photo)
                    : null,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: aboutText,
              decoration: const InputDecoration(
                labelText: 'Hakkında',
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              'Location',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            CountryStateCityPicker(
              country: country,
              state: state,
              city: city,
              dialogColor: Colors.grey.shade200,
              textFieldDecoration: InputDecoration(
                fillColor: Colors.blueGrey.shade100,
                filled: true,
                suffixIcon: const Icon(Icons.arrow_downward_rounded),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _isUploading = true;
          });

          await uploadImage();

          setState(() {
            _isUploading = false;
          });

          navi();
        },
        child: _isUploading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ) // Yükleme sırasında gösterilecek widget
            : const Icon(Icons.arrow_forward),
      ),
    );
  }

  Future<void> saveUserAttributes() async {
    final result = await Amplify.Auth.getCurrentUser();
    try {
      final existingUsers = await Amplify.DataStore.query(
        User.classType,
        where: User.USER_NAME.eq(result.username),
      );
      final existingUser = existingUsers.first;
      final updatedUser = existingUser.copyWith(
          bio: aboutText.text,
          country: country.text,
          state: state.text,
          city: city.text,
          pic: myKey);
      await Amplify.DataStore.save(updatedUser);
      safePrint('Saved item');
    } catch (e) {
      safePrint('Error saving item: $e');
    }
  }

  Future<void> selectImage() async {
    await saveUserAttributes();
    final item = await Amplify.Auth.getCurrentUser();
    myKey = "profil photos/${item.username}.png";
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: false,
      withReadStream: true,
      allowedExtensions: ['jpg', 'png', 'gif'],
    );

    if (result == null) {
      safePrint('No file selected');
      return;
    }
    final platformFile = result.files.single;
    final resizedImage = await FlutterImageCompress.compressWithFile(
      platformFile.path!,
      minWidth: 110,
      minHeight: 110,
      quality: 85,
    );
    setState(() {
      _selectedImage = File(platformFile.path!);
      myImage = resizedImage;
    });
  }

  Future<void> uploadImage() async {
    try {
      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          Stream.fromIterable(myImage!.map((e) => [e])),
          size: myImage!.length,
        ),
        key: myKey!,
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.fractionCompleted}');
        },
      ).result;
      safePrint('Successfully uploaded file: ${result.uploadedItem.key}');
    } on StorageException catch (e) {
      safePrint('Error uploading file: $e');
      rethrow;
    }
  }

  Future<void> navi() async {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
