part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'E-mail',
          ),
          const SizedBox(height: 20),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          CuidapetDefaultButton(
            onPressed: () {},
            label: 'Entrar',
          ),
        ],
      ),
    );
  }
}
