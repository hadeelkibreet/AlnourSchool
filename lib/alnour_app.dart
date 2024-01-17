import 'package:alnour/core/student_profile/student_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AlnourApp extends StatelessWidget {
  const AlnourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? StudentProfile()
          : StudentProfile(),
    );
  }
}
