part of '../login_page.dart';

class _LoginRegisterButton extends StatelessWidget {
  const _LoginRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        RoundedButtonWithIcon(
          onTap: () {},
          width: 150.sw,
          color: const Color(0xFF4267B3),
          icon: CuidapetIcons.facebook,
          label: 'Facebook',
        ),
        RoundedButtonWithIcon(
          onTap: () {},
          width: 150.sw,
          color: const Color(0xFFE15031),
          icon: CuidapetIcons.google,
          label: 'Google',
        ),
        RoundedButtonWithIcon(
          onTap: () {},
          width: 150.sw,
          color: context.primaryColorDark,
          icon: Icons.mail,
          label: 'Cadastre-se',
        ),
      ],
    );
  }
}
