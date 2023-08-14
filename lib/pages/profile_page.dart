import 'dart:typed_data';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import '../models/ModelProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getKey();
  }

  String? myKey;
  Uint8List? myImage;
  bool isLoading = true;
  bool hasImage = false;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isLoading)
            const CircleAvatar(
              radius: 80,
              child: CircularProgressIndicator(),
            ),
          if (!isLoading && hasImage)
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(url!),
            ),
          if (!isLoading && !hasImage && hasError)
            const CircleAvatar(
              radius: 80,
              child: Icon(Icons.person),
            ),
        ],
      ),
    );
  }

  String? key;
  String? url;
  Future<void> getKey() async {
    final item = await Amplify.Auth.getCurrentUser();
    try {
      final existingUsers = await Amplify.DataStore.query(
        User.classType,
        where: User.USER_NAME.eq(item.username),
      );
      final existingUser = existingUsers.first;
      myKey = existingUser.pic_key;
    } on StorageException catch (e) {
      setState(() {
        hasError = true;
        key = myKey;
      });
      safePrint(e.message);
    }
    //downloadToMemory();
  }

  Future<void> getUrl() async {
    try {
      final result = await Amplify.Storage.getUrl(
        key: key!,
      ).result;
      setState(() {
        url = result.url.toString();
        isLoading = false;
        hasImage = true;
      });
    } on StorageException catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      safePrint(e.message);
    }
  }
}
