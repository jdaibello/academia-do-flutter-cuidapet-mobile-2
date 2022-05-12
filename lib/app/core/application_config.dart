import 'package:cuidapet_mobile_2/app/core/helpers/environments.dart';
import 'package:cuidapet_mobile_2/app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseCoreConfig();
    await _loadEnvs();
  }

  Future<void> _firebaseCoreConfig() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.android,
    );
  }

  Future<void> _loadEnvs() => Environments.loadEnvs();
}
