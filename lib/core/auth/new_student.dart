import 'package:alnour/core/auth/new_student_step/step0/step0.dart';
import 'package:alnour/core/auth/new_student_step/step1/step1.dart';
import 'package:alnour/core/auth/new_student_step/step2/step2.dart';
import 'package:alnour/enums/student_enum.dart';
import 'package:alnour/model/pending_model.dart';
import 'package:alnour/model/student_model.dart';
import 'package:alnour/providers/select_cls_provider.dart';
import 'package:alnour/providers/select_date_provider.dart';
import 'package:alnour/services/authservies.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants/backgroundimage.dart';
import '../../constants/constants/circle.dart';
import '../../constants/constants/images.dart';
import '../../providers/image_provider.dart';
import '../../providers/select_gender_provider.dart';
import '../../providers/services_provider.dart';
import '../../providers/uid_provider.dart';
import '../student_profile/student_profile.dart';

class NewStudent extends ConsumerStatefulWidget {
  const NewStudent({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => NewStudent());
  }

  @override
  ConsumerState<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends ConsumerState<NewStudent> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  late PageController _pageController;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fathernameController = TextEditingController();
  final TextEditingController mathernameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkpasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController adrissController = TextEditingController();

  int _currentPageIndex = 0;
  List<String> _stepTitles = ['w', 'S', 'p'];
  void _nextPage() {
    final finalprofileimg = ref.read(ProfileImgProvider);
    final finalidimg = ref.read(IdImgProvider);
    final finalcertificateimg = ref.read(CertificateImgProvider);
    if (_currentPageIndex == 0) {
      if (nameController.text.isNotEmpty &&
          fathernameController.text.isNotEmpty &&
          mathernameController.text.isNotEmpty &&
          lastnameController.text.isNotEmpty) {
        if (_currentPageIndex < _stepTitles.length - 1) {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '.الرجاء ملئ جميع الحقول',
              textAlign: TextAlign.right,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    if (_currentPageIndex == 1) {
      if (emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          checkpasswordController.text.isNotEmpty &&
          checkpasswordController.text == passwordController.text) {
        if (_currentPageIndex < _stepTitles.length - 1) {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              checkpasswordController.text != passwordController.text
                  ? '.كلمة المرور غير متطابقة'
                  : '.الرجاء ملئ جميع الحقول',
              textAlign: TextAlign.right,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
    if (_currentPageIndex == 2) {
      if (finalprofileimg != '' &&
          finalidimg != '' &&
          finalcertificateimg != '') {
        if (_currentPageIndex < _stepTitles.length - 1) {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '.الرجاء تحميل الصور بصيغة jpg , png',
              textAlign: TextAlign.right,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _finalPage() async {
    final String? uid = await registerWithEmailAndPassword(
        emailController.text, passwordController.text);

    ref.read(UidProvider.notifier).update((state) => uid.toString());
    final finalage = ref.read(selectedDateProvider);
    final finalgender = ref.read(SelectGenderProvider);
    final finalCls = ref.read(ClsProvider);
    final finalprofileimg = ref.read(ProfileImgProvider);
    final finalidimg = ref.read(IdImgProvider);
    final finalcertificateimg = ref.read(CertificateImgProvider);
    ref.read(servieceProvider).addstudent(StudentModel(
          uid: uid.toString(),
          age: finalage.toString(),
          adriss: adrissController.text,
          cls: finalCls.toString(),
          email: emailController.text,
          fathername: fathernameController.text,
          lastname: lastnameController.text,
          mathername: mathernameController.text,
          name: nameController.text,
          password: passwordController.text,
          Accept: StudentStatus.pending,
          phone: phoneController.text,
          gender: finalgender.toString(),
          profileimg: finalprofileimg.toString(),
          idimg: finalidimg.toString(),
          certificateimg: finalcertificateimg.toString(),
        ));
    ref.read(servieceProvider).addpending(PendingModel(uid: uid.toString()));
    ref.read(servieceProvider).addFieldToClsDocument(
        finalCls.toString(), "name_${uid.toString()}", uid.toString());

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.requestPermission();
    messaging.getToken().then((token) {
      print('Token: $token');
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'Received notification: ${message.notification?.title} - ${message.notification?.body}');
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            //AbuteUs(uid: uid),
            StudentProfile(uid: uid.toString()),
      ),
    );
  }

  void _previousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    nameController.dispose;
    fathernameController.dispose;
    mathernameController.dispose;
    lastnameController.dispose;
    adrissController.dispose;
    phoneController.dispose;
    passwordController.dispose;
    emailController.dispose;
    checkpasswordController.dispose;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Stack(
              children: [
                BackGroundImage(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Row(
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleWithNumber(
                                    number: 1,
                                    radius: _currentPageIndex >= 0 ? 16 : 20,
                                    color: _currentPageIndex >= 0
                                        ? Colors.deepPurpleAccent
                                        : Colors.black12,
                                    textStyle: TextStyle()),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleWithNumber(
                                    number: 2,
                                    radius: _currentPageIndex >= 0 ? 16 : 20,
                                    color: _currentPageIndex >= 1
                                        ? Colors.deepPurpleAccent
                                        : Colors.black12,
                                    textStyle: TextStyle()),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleWithNumber(
                                    number: 3,
                                    radius: _currentPageIndex >= 0 ? 16 : 20,
                                    color: _currentPageIndex >= 2
                                        ? Colors.deepPurpleAccent
                                        : Colors.black12,
                                    textStyle: TextStyle()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formkey,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: PageView(
                              physics: NeverScrollableScrollPhysics(),
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPageIndex = index;
                                  print(index);
                                });
                              },
                              children: [
                                Center(
                                    child: Step0(
                                        nameController: nameController,
                                        fathernameController:
                                            fathernameController,
                                        mathernameController:
                                            mathernameController,
                                        lastnameController:
                                            lastnameController)),
                                Center(
                                    child: Step1(
                                        emailController: emailController,
                                        passwordController: passwordController,
                                        checkpasswordController:
                                            checkpasswordController,
                                        phoneController: phoneController,
                                        adrissController: adrissController)),
                                Center(child: Step2()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _currentPageIndex == 0
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: FloatingActionButton(
                        onPressed: _previousPage,
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
              FloatingActionButton(
                onPressed: () {
                  _currentPageIndex == 2 ? _finalPage() : _nextPage();
                },
                child: _currentPageIndex == 2
                    ? Icon(Icons.add)
                    : Icon(Icons.arrow_forward_ios),
              ),
            ],
          )),
    );
  }
}
