part of '_index.dart';

class RegisterData {
  final rxTitle = 'Register'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxForm = RM.injectForm(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    submit: () async {
      logx.wtf('abcdef');
      await _ct.signUpEmailAndPassword();
      logx.wtf('wlwlwlw');
    },
  );

  final rxUser = RM.inject<UserCredential?>(() => null);

  final rxEmail = RM.injectTextEditing(
    validators: [
      Validate.isNotEmpty,
      Validate.isEmail,
    ],
  );

  final rxPassword = RM.injectTextEditing(
    validators: [
      Validate.isNotEmpty,
      Validate.pwdContain,
    ],
  );

  final rxRetypePassword = RM.injectTextEditing(
    validators: [
      Validate.isNotEmpty,
      Validate.pwdEquals,
    ],
  );
}
