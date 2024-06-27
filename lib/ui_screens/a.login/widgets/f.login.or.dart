part of '../_index.dart';

class LoginOr extends StatelessWidget {
  const LoginOr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        SizedBoxW(3),
        Text('OR'),
        SizedBoxW(3),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
