import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/profile_page.dart';
import '../models/ModelProvider.dart';
import 'package:file_picker/file_picker.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  TextEditingController aboutText = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  File? _selectedImage;
  String url = '';
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
              onTap: uploadImage, // Function to pick an image
              child: CircleAvatar(
                radius: 40,
                backgroundImage:
                    _selectedImage != null ? FileImage(_selectedImage!) : null,
                child: _selectedImage == null ? Icon(Icons.add_a_photo) : null,
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
        onPressed: () {
          saveUserAttributes();
        },
        child: const Icon(Icons.save),
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
          pic: url);
      await Amplify.DataStore.save(updatedUser);
      safePrint('Saved item');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } catch (e) {
      safePrint('Error saving item: $e');
    }
  }

  Future<void> uploadImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      withData: false,
      // Ensure to get file stream for better performance
      withReadStream: true,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result == null) {
      return;
    }
    final platformFile = result.files.single;

    setState(() {
      _selectedImage = File(platformFile.path!);
    });
    final xxx = await Amplify.Auth.getCurrentUser();
    // Upload file with its filename as the key
    try {
      await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromStream(
          platformFile.readStream!,
          size: platformFile.size,
        ),
        key: "profil photos/${xxx.username}.jpg",
        onProgress: (progress) {
          //safePrint('Fraction completed: ${progress.fractionCompleted}');
        },
      ).result;
      //safePrint('Successfully uploaded file: ${result.uploadedItem.key}');
    } on StorageException catch (e) {
      safePrint('Error uploading file: $e');
      rethrow;
    }

    final item = await Amplify.Storage.getUrl(
      key: "profil photos/${xxx.username}.jpg",
      options: const StorageGetUrlOptions(
        accessLevel: StorageAccessLevel.protected,
      ),
    ).result;
    var myUrl = item.url.toString();
    url = myUrl;
    safePrint(url);
  }
}
