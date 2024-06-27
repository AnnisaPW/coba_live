part of '../_index.dart';

class RegisterToLogin extends StatelessWidget {
  const RegisterToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        nav.toReplacement(Routes.login);
      },
      child: const Text('Already have an account? Sign in'),
    );
  }
}
