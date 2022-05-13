import 'package:cuidapet_mobile_2/app/core/logger/app_logger.dart';
import 'package:cuidapet_mobile_2/app/core/ui/extensions/size_screen_extension.dart';
import 'package:cuidapet_mobile_2/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet_mobile_2/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/cuidapet_default_button.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:cuidapet_mobile_2/app/core/ui/widgets/rounded_button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'widgets/login_form.dart';
part 'widgets/login_register_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var log = Modular.get<AppLogger>();
    log.append('Mensagem 1');
    log.append('Mensagem 2');
    log.append('Mensagem 3');
    log.append('Mensagem 4');
    log.append('Mensagem 5');
    log.closeAppend();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 162.w,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              const _LoginForm(),
              const SizedBox(height: 8),
              const _OrSeparator(),
              const SizedBox(height: 8),
              const _LoginRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'OU',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: context.primaryColor,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: context.primaryColor,
          ),
        ),
      ],
    );
  }
}
