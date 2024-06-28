part of '_index.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              builder: () => const SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign up',
                      textScaler: TextScaler.linear(3),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBoxH(20),
                    RegisterEmail(),
                    SizedBoxH(15),
                    RegisterPassword(),
                    SizedBoxH(15),
                    RegisterRetypePassword(),
                    SizedBoxH(20),
                    RegisterSubmit(),
                    SizedBoxH(10),
                    RegisterToLogin(),
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
