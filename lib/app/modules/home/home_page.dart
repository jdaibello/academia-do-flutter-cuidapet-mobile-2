import 'package:cuidapet_mobile_2/app/core/rest_client/rest_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text('Logout'),
          ),
          TextButton(
            onPressed: () async {
              final categoriesResponse =
                  await Modular.get<RestClient>().auth().get('/categories/');

              debugPrint(categoriesResponse.data.toString());
            },
            child: const Text('Teste Refresh Token'),
          ),
        ],
      ),
    );
  }
}
