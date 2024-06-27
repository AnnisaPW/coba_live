part of '_index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 70),
            child: OnFormBuilder(
              listenTo: _dt.rxForm,
              builder: () => const SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in',
                      textScaler: TextScaler.linear(3),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBoxH(20),
                    LoginEmail(),
                    SizedBoxH(15),
                    LoginPassword(),
                    SizedBoxH(15),
                    LoginSubmit(),
                    SizedBoxH(15),
                    LoginOr(),
                    SizedBoxH(15),
                    LoginAnonymous(),
                    SizedBoxH(10),
                    LoginWithGoogle(),
                    SizedBoxH(15),
                    LoginToRegister(),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
