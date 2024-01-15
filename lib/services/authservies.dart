import 'package:firebase_auth/firebase_auth.dart';

Future<String?> registerWithEmailAndPassword(
    String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  return userCredential.user?.uid;
}

void loginWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print('login sucss');
  } on FirebaseAuthException catch (e) {
    print('login faild $e');
  } catch (e) {
    print('Something else happend $e');
  }
}

void signOutInApp() async {
  await FirebaseAuth.instance.signOut();
}
