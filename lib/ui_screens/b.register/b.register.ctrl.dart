part of '_index.dart';

class RegisterCtrl {
  init() => logxx.i(RegisterCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  signUpEmailAndPassword() async {
    await _sv.createEmailAndPassword(_dt.rxEmail.value, _dt.rxPassword.value);
  }

  submit() => _dt.rxForm.submit();
}
