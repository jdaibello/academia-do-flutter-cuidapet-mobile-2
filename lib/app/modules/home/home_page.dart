import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
