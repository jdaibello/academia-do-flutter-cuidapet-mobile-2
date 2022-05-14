part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState
    extends ModularState<_RegisterForm, RegisterController> {
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
          CuidapetTextFormField(
            label: 'Confirmar senha',
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Confirmar senha obrigatória'),
              Validatorless.min(
                6,
                'Confirmar senha precisa ter pelo menos 6 caracteres',
              ),
              Validatorless.compare(
                _passwordEC,
                'Senha e Confirmar senha não são iguais',
              ),
            ]),
          ),
          const SizedBox(height: 20),
          CuidapetDefaultButton(
            onPressed: () {
              final formValid = _formKey.currentState?.validate() ?? false;

              if (formValid) {
                controller.register(
                  email: _emailEC.text,
                  password: _passwordEC.text,
                );
              }
            },
            label: 'Cadastrar',
          ),
        ],
      ),
    );
  }
}
