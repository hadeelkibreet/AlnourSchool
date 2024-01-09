import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

   Future<void> logInWithEmailAndPassword(
       String email, String password, BuildContext context) async {
      try {
         await _firebaseAuth.signInWithEmailAndPassword(
            email: email,
            password: password,
         );
         // You can add navigation or any other logic after successful login
      } on FirebaseAuthException catch (e) {
         // Handle login error here
         print('Login Error: $e');
         showDialog(
            context: context,
            builder: (context) => AlertDialog(
               title: Text('Error'),
               content: Text('Failed to log in. Please try again.'),
               actions: [
                  TextButton(
                     onPressed: () => Navigator.pop(context),
                     child: Text('OK'),
                  ),
               ],
            ),
         );
      }
   }

   Future<void> newStudentWithEmailAndPassword(
       String email, String password, BuildContext context) async {
      try {
         await _firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
         );
         // You can add navigation or any other logic after successful login
      } on FirebaseAuthException catch (e) {
         // Handle login error here
         print('Login Error: $e');
         showDialog(
            context: context,
            builder: (context) => AlertDialog(
               title: Text('Error'),
               content: Text('Failed to log in. Please try again.'),
               actions: [
                  TextButton(
                     onPressed: () => Navigator.pop(context),
                     child: Text('OK'),
                  ),
               ],
            ),
         );
      }catch(e){
         if(e=='email already in used'){
            showDialog(
               context: context,
               builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('email already in used'),
                  actions: [
                     TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                     ),
                  ],
               ),
            );
         }else{
            showDialog(
               context: context,
               builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('Error: $e'),
                  actions: [
                     TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                     ),
                  ],
               ),
            );
         }
      }
   }

   Future<void> signOut()async{
     await _firebaseAuth.signOut();
   }
}