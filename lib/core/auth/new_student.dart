import 'package:alnour/core/auth/new_student_step/step0/step0.dart';
import 'package:alnour/core/auth/new_student_step/step1/step1.dart';
import 'package:alnour/core/auth/new_student_step/step2/step2.dart';
import 'package:alnour/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/constants/backgroundimage.dart';
import '../../constants/constants/circle.dart';
import '../../constants/constants/images.dart';
import '../../providers/services_provider.dart';

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
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController chakepasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController clsController = TextEditingController();
  final TextEditingController adrissController = TextEditingController();
  bool AcceptController = true;
  String hadil = 'hadil';
  int _currentPageIndex = 0;
  List<String> _stepTitles = ['w', 'S', 'p'];
  void _nextPage() {
    if (_currentPageIndex < _stepTitles.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _finalPage() {
    ref.read(servieceProvider).addstudent(StudentModel(
        age: ageController.text,
        adriss: adrissController.text,
        cls: clsController.text,
        email: emailController.text,
        fathername: fathernameController.text,
        image: imageController.text,
        lastname: lastnameController.text,
        mathername: mathernameController.text,
        name: nameController.text,
        password: passwordController.text,
        Accept: AcceptController,
        phone: phoneController.hashCode,
        gender: genderController.text));
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
                                        genderController: genderController,
                                        ageController: ageController,
                                        lastnameController:
                                            lastnameController)),
                                Center(
                                    child: Step1(
                                        emailController: emailController,
                                        passwordController: passwordController,
                                        chakepasswordController:
                                            chakepasswordController,
                                        phoneController: phoneController,
                                        clsController: clsController,
                                        adrissController: adrissController)),
                                Center(
                                    child: Step2(
                                  imageController: imageController,
                                )),
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
                  if (chakepasswordController.text == passwordController.text) {
                    _currentPageIndex == 2 ? _finalPage() : _nextPage();
                  }
                },
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          )),
    );
  }
}
