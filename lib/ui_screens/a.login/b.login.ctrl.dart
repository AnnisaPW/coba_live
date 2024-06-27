part of '_index.dart';

class LoginCtrl {
  init() => logxx.i(LoginCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  signInAnonymous() async {
    await _sv.signInAnonymous();
  }

  // signOut() async {
  //   await _sv.signOut();
  // }

  submitEmailAndPassword() async {
    await _sv.signInWithEmailAndPassword(_dt.rxEmail.value, _dt.rxPassword.value);
  }

  signInWithGoogle() async {
    await _sv.signInWithGoogle();
  }

  submit() => _dt.rxForm.submit();
}
