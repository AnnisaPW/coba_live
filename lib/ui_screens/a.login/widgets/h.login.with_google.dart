part of '../_index.dart';

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        _ct.signInWithGoogle();
      },
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromWidth(200),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset('assets/images/g-logo.png'),
          ),
          const SizedBoxW(6),
          const Text('Sign in With Google'),
        ],
      ),
    );
  }
}
