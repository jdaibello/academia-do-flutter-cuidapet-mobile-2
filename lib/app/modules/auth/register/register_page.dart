import 'package:cuidapet_mobile_2/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:flutter/material.dart';

part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Usuário'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 162.w,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              const _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
