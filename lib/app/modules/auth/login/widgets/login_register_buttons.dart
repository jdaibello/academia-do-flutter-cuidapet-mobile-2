part of '../login_page.dart';

class _LoginRegisterButtons extends StatelessWidget {
  final controller = Modular.get<LoginController>();

  _LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          onTap: () {
            controller.socialLogin(SocialLoginType.facebook);
          },
          width: 150.w,
          color: const Color(0xFF4267B3),
          icon: CuidapetIcons.facebook,
          label: 'Facebook',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            controller.socialLogin(SocialLoginType.google);
          },
          width: 150.w,
          color: const Color(0xFFE15031),
          icon: CuidapetIcons.google,
          label: 'Google',
        ),
        RoundedButtonWithIcon(
          onTap: () {
            Navigator.pushNamed(context, '/auth/register');
          },
          width: 150.w,
          color: context.primaryColorDark,
          icon: Icons.mail,
          label: 'Cadastre-se',
        ),
      ],
    );
  }
}
