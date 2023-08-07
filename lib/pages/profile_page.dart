import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import '../models/ModelProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getUrl();
  }

  String url = "";
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
          // Yeni eklenen kontrol
          CircleAvatar(radius: 80, backgroundImage: NetworkImage(url)),
        ],
      ),
    );
  }

  Future<void> getUrl() async {
    final usernm = await Amplify.Auth.getCurrentUser();
    try {
      final existingUsers = await Amplify.DataStore.query(
        User.classType,
        where: User.USER_NAME.eq(usernm.username),
      );
      final existingUser = existingUsers.first;
      setState(() {
        url = existingUser.pic!;
      });
    } on StorageException catch (e) {
      safePrint(e.message);
    }
  }
}
