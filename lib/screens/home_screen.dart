import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import '../models/ModelProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    // TODO: Kullanıcının profil fotoğrafını ekleyin
                    radius: 20,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Image.asset('assets/img_1.jpg'), // Örnek bir resim
              const SizedBox(height: 8.0),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up),
                    onPressed: () {
                      // TODO: Beğeni işlemleri
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.comment),
                    onPressed: () {
                      // TODO: Yorum işlemleri
                    },
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  File? myFile;
  Future<void> getKey() async {
    final item = await Amplify.Auth.getCurrentUser();
    try {
      final existingUsers = await Amplify.DataStore.query(
        User.classType,
        where: User.USER_NAME.eq(item.username),
      );
      final existingUser = existingUsers.first;
      Post? post = existingUser.Posts?.first;
    } on StorageException catch (e) {
      safePrint(e.message);
    }
    //downloadToMemory();
  }

  // Future<void> downloadToMemory() async {
  //   try {
  //     final result = await Amplify.Storage.downloadData(
  //       key: myKey!,
  //       onProgress: (progress) {
  //         safePrint('Fraction completed: ${progress.fractionCompleted}');
  //       },
  //     ).result;
  //     setState(() {
  //       myData = Uint8List.fromList(result.bytes);
  //     });
  //   } on StorageException catch (e) {
  //     safePrint(e.message);
  //   }
  // }
}
