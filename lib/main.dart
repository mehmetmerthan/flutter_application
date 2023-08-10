import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter_application/pages/auth_page.dart';
//import 'package:flutter_application/pages/home_page.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    final auth = AmplifyAuthCognito();
    final api = AmplifyAPI();
    final storage = AmplifyStorageS3();
    final datastore = AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([api, auth, datastore, storage]);

    try {
      await Amplify.configure(amplifyconfig);
      safePrint('Amplify successfully configured');
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          'Amplify was already configured. Ignoring duplicate configuration.');
    } catch (e) {
      safePrint('Error configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
    );
  }
}
