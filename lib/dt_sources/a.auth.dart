part of '_index.dart';

final x1FbAuth = RM.inject(
  () => FbAuth(),
  debugPrintWhenNotifiedPreMessage: '',
);

class FbAuth {
  final instance = FirebaseAuth.instance;

  Future<UserCredential> signInAnonymous() async {
    final user = await FirebaseAuth.instance.signInAnonymously();
    return user;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
    UserCredential? userCredential;
    if (kIsWeb) {
      final authProvider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
      userCredential = await FirebaseAuth.instance.signInWithPopup(authProvider);
    } else {
      final googleSignIn = await GoogleSignIn().signIn();
      final googleAuth = await googleSignIn?.authentication;
      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      userCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
    }
    return userCredential;
  }

  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> createEmailAndPassword(String email, String password) async {
    final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }
}
