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
              builder: () => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign in',
                      textScaler: TextScaler.linear(3),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBoxH(20),
                    const LoginEmail(),
                    const SizedBoxH(15),
                    const LoginPassword(),
                    const SizedBoxH(15),
                    const LoginSubmit(),
                    const SizedBoxH(15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Divider(color: Colors.grey)),
                        SizedBoxW(3),
                        Text('OR'),
                        SizedBoxW(3),
                        Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
                    const SizedBoxH(15),

                    OutlinedButton(
                      onPressed: () {
                        _ct.signInAnonymous();
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size.fromWidth(200),
                      ),
                      child: const Text(
                        "Sign in Anonymously",
                      ),
                    ),
                    const SizedBoxH(10),
                    OutlinedButton(
                      onPressed: () {
                        _ct.signInWithGoogle();
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size.fromWidth(200),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
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
                    ),
                    const SizedBoxH(15),
                    TextButton(
                      onPressed: () {
                        nav.toReplacement(Routes.register);
                      },
                      child: const Text('Don\'t have an account? Sign up'),
                    ),
                    // OutlinedButton(
                    //   onPressed: () {
                    //     _ct.signOut();
                    //   },
                    //   child: const Text('Sign out'),
                    // ),
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
