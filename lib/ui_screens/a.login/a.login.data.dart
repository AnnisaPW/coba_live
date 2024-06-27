part of '_index.dart';

class LoginData {
  final rxTitle = 'Login'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxUser = RM.inject<UserCredential?>(() => null);

  final rxForm = RM.injectForm(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    submit: () async {
      await _ct.submitEmailAndPassword();
    },
  );

  final rxEmail = RM.injectTextEditing(
    validators: [
      Validate.isEmail,
      Validate.isNotEmpty,
    ],
  );

  final rxPassword = RM.injectTextEditing(
    validators: [
      Validate.isNotEmpty,
    ],
  );
}
