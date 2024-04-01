import 'package:alnour/core/auth/new_student.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants/backgroundimage.dart';
import '../../constants/constants/images.dart';
import '../../providers/uid_provider.dart';
import '../../services/authservies.dart';
import '../student_profile/student_profile.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          BackGroundImage(),
          SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              ImageAssets.nour,
                              width: 80,
                            ),
                            Image.asset(
                              ImageAssets.book,
                              width: 80,
                            ),
                          ],
                        ),
                        Image.asset(
                          ImageAssets.school,
                          width: 70,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'boutros',
                    ),
                    child: Text('تسجيل الدخول'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: width * 0.9,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains("@")) {
                              return 'الرجاء كتابة البريد بشكل صحيح';
                            }
                            // Add additional validation logic here if needed
                            return null; // Return null if the value is valid
                          },
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: 'ادخل البريد الإلكتروني',
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.grey.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width * 0.9,
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاءادخال كلمة المرور';
                        }
                        // Add additional validation logic here if needed
                        return null; // Return null if the value is valid
                      },
                      textAlign: TextAlign.right,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'ادخل كلمة المرور',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        suffixIcon: Icon(Icons.password),
                        prefixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: width * 0.5,
                    height: height * 0.07,
                    child: ElevatedButton(
                        onPressed: () async {
                          final String? uid = await loginWithEmailAndPassword(
                              _emailController.text, _passwordController.text);
                          ref
                              .read(UidProvider.notifier)
                              .update((state) => uid.toString());
                          if (uid != null) {
                            FirebaseMessaging messaging =
                                FirebaseMessaging.instance;

                            messaging.requestPermission();
                            messaging.getToken().then((token) {
                              print('Token: $token');
                            });

                            FirebaseMessaging.onMessage
                                .listen((RemoteMessage message) {
                              print(
                                  'Received notification: ${message.notification?.title} - ${message.notification?.body}');
                            });
                            print(uid);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    //AbuteUs(uid: uid),
                                    StudentProfile(uid: uid),
                              ),
                            );
                          } else {
                            print('no uiddddddddd');
                          }
                          // signOutInApp();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: Colors
                                  .blueAccent, // Replace with your desired border color
                              width: 5.0, // Adjust the width of the border
                            ),
                          ),
                        ),
                        child: const Text(
                          'تسجيل دخول',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'boutros',
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontFamily: 'boutros',
                        fontSize: 12,
                      ),
                      child: TextButton(
                        onPressed: () {
                          signOutInApp();
                        },
                        child: Text('هل نسيت كلمة المرور؟'),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewStudent()),
                      );
                    },
                    child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontFamily: 'boutros',
                          fontSize: 20,
                        ),
                        child: Text('هل انت طالب جديد؟ انقر للتسجيل لدينا')),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
