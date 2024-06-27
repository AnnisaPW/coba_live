part of '_index.dart';

class AuthServ {
  void init() {
    logxx.i(AuthServ, '...');
    _pv.rxUser.subscription = x1FbAuth.st.instance.authStateChanges().listen(
          (event) => _pv.rxUser.st = event,
        );
  }

  void updateRandom() {
    _pv.rxRandom.st = _rp.giveNewRandom();
  }

  void onSetState() {
    logzz.i(AuthServ, 'rxCounter setState success');
  }

  responseAuthState(User? user) async {
    if (nav.routeData.location == '/login' || nav.routeData.location == '/register') {
      if (user != null) {
        nav.toReplacement(Routes.productList);
      }
    } else {
      if (user == null) {
        nav.toAndRemoveUntil(Routes.login);
      }
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    await x1FbAuth.st.signInWithEmailPassword(email, password);
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    await x1FbAuth.st.createEmailAndPassword(email, password);
  }

  Future signOut() async {
    await x1FbAuth.st.signOut();
  }

  Future signInWithGoogle() async {
    await x1FbAuth.st.signInWithGoogle();
  }

  Future signInAnonymous() async {
    await x1FbAuth.st.signInAnonymous();
  }

  Future createEmailAndPassword(String email, String password) async {
    await x1FbAuth.st.createEmailAndPassword(email, password);
  }
}
