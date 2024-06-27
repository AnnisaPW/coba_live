part of '../_index.dart';

class LoginAnonymous extends StatelessWidget {
  const LoginAnonymous({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        _ct.signInAnonymous();
      },
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromWidth(200),
      ),
      child: const Text(
        "Sign in Anonymously",
      ),
    );
  }
}
