import 'package:alnour/services/authservies.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authProvider=Provider<AuthServices>((ref){
  return AuthServices();
});

final authStateProvider=StreamProvider<User?>((ref){
  return ref.read(authProvider).authStateChange;

});
