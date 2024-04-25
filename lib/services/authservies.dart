import 'package:firebase_auth/firebase_auth.dart';

Future<String?> registerWithEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  return userCredential.user?.uid;
}

Future<String?> loginWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    final uid = user?.uid;
    print('Login success');
    return uid;
  } on FirebaseAuthException catch (e) {
    print('Login failed: $e');
    return null;
  } catch (e) {
    print('Something else happened: $e');
    return null;
  }
}

void signOutInApp() async {
  await FirebaseAuth.instance.signOut();
}
