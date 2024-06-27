part of '_index.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(56),
      //   child: RegisterAppbar(),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            padding: const EdgeInsets.fromLTRB(20, 70, 20, 70),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: OnFormBuilder(
              listenTo: _dt.rxForm,
              builder: () => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign up',
                      textScaler: TextScaler.linear(3),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBoxH(20),
                    const RegisterEmail(),
                    const SizedBoxH(15),
                    const RegisterPassword(),
                    const SizedBoxH(15),
                    const RegisterRetypePassword(),
                    const SizedBoxH(20),
                    const RegisterSubmit(),
                    const SizedBoxH(10),
                    TextButton(
                      onPressed: () {
                        nav.toReplacement(Routes.login);
                      },
                      child: const Text('Already have an account? Sign in'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
