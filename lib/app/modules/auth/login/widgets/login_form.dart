part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final controller = Modular.get<LoginController>();
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'E-mail',
            controller: _emailEC,
            validator: Validatorless.multiple([
              Validatorless.required('E-mail obrigatório'),
              Validatorless.email('E-mail inválido'),
            ]),
          ),
          const SizedBox(height: 20),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres'),
            ]),
          ),
          const SizedBox(height: 20),
          CuidapetDefaultButton(
            onPressed: () async {
              final formValid = _formKey.currentState?.validate() ?? false;

              if (formValid) {
                await controller.login(_emailEC.text, _passwordEC.text);
              }
            },
            label: 'Entrar',
          ),
        ],
      ),
    );
  }
}
