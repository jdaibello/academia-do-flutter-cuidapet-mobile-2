import 'package:cuidapet_mobile/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet_mobile/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            CuidapetTextFormField(
              label: 'E-mail',
            ),
            CuidapetTextFormField(
              label: 'Senha',
              obscureText: true,
            ),
            const Icon(CuidapetIcons.google),
          ],
        ),
      ),
    );
  }
}
