part of '_index.dart';

class RegisterCtrl {
  init() => logxx.i(RegisterCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  // Future<UserCredential> createEmailAndPassword(String email, String password) async {
  //   final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );
  //   return result;
  // }

  // Future<void> signUpEmailAndPassword() async {
  //   _dt.rxUser.st = await createEmailAndPassword(
  //     'exa@mail.com',
  //     'secret12',
  //   );
  // }

  signUpEmailAndPassword() async {
    await _sv.createEmailAndPassword(_dt.rxEmail.value, _dt.rxPassword.value);
  }

  submit() => _dt.rxForm.submit();
}
