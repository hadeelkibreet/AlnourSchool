import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../constants/constants/backgroundimage.dart';
import '../../constants/constants/images.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({Key? key}) : super(key: key);

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  late PageController _pageController;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fathernameController = TextEditingController();
  final TextEditingController mathernameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController chakepasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController adrissController = TextEditingController();

  int _currentPageIndex = 0;
  List<String> _stepTitles = ['w', 'S', 'p'];
  void _nextPage() {
    if (_currentPageIndex < _stepTitles.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
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
          body: Stack(
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
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Row(
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     CircleWithNumber(
                          //         number: 1,
                          //         radius: _currentPageIndex >= 0 ? 16 : 20,
                          //         color: _currentPageIndex >= 0
                          //             ? Colors.deepPurpleAccent
                          //             : Colors.black12,
                          //         textStyle: TextStyle()),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     CircleWithNumber(
                          //         number: 2,
                          //         radius: _currentPageIndex >= 0 ? 16 : 20,
                          //         color: _currentPageIndex >= 1
                          //             ? Colors.deepPurpleAccent
                          //             : Colors.black12,
                          //         textStyle: TextStyle()),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     CircleWithNumber(
                          //         number: 3,
                          //         radius: _currentPageIndex >= 0 ? 16 : 20,
                          //         color: _currentPageIndex >= 2
                          //             ? Colors.deepPurpleAccent
                          //             : Colors.black12,
                          //         textStyle: TextStyle()),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formkey,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: PageView(
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
                                      sexController: sexController,
                                      ageController: ageController,
                                      lastnameController: lastnameController)),
                              Center(
                                  child: Step1(
                                      emailController: emailController,
                                      passwordController: passwordController,
                                      chakepasswordController:
                                          chakepasswordController,
                                      phoneController: phoneController,
                                      classController: classController,
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
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPageIndex == 0
                    ? SizedBox()
                    : FloatingActionButton(
                        onPressed: _previousPage,
                        child: Icon(Icons.arrow_back_ios),
                      ),
                FloatingActionButton(
                  onPressed: _nextPage,
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          )),
    );
  }
}

class Step0 extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController fathernameController;
  final TextEditingController mathernameController;
  final TextEditingController lastnameController;
  final TextEditingController sexController;
  final TextEditingController ageController;

  const Step0({
    Key? key,
    required this.nameController,
    required this.fathernameController,
    required this.mathernameController,
    required this.sexController,
    required this.ageController,
    required this.lastnameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'الأسم الأول',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.face_retouching_natural_outlined,
                  color: Colors.grey.withOpacity(0.9)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: fathernameController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'أسم الأب',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.face_6_outlined,
                  color: Colors.grey.withOpacity(0.9)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: mathernameController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'أسم الام',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.face_3_outlined,
                  color: Colors.grey.withOpacity(0.9)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: lastnameController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'أسم العائلة',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.foundation_outlined,
                  color: Colors.grey.withOpacity(0.9)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // إضافة حقل اختيار تاريخ الميلاد
              BirthDateField(
                agecontroller: ageController,
              ),
              // SizedBox(width: 15,),
              // إضافة حقل اختيار الجنس
              GenderSelectionField(
                controller: sexController,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// حقل اختيار الجنس
class GenderSelectionField extends StatefulWidget {
  final TextEditingController controller;

  GenderSelectionField({required this.controller});

  @override
  _GenderSelectionFieldState createState() => _GenderSelectionFieldState();
}

class _GenderSelectionFieldState extends State<GenderSelectionField> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DefaultTextStyle(
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            child: Text('اختر الجنس')),
        SizedBox(height: 8),
        ToggleButtons(
          selectedBorderColor: Colors.white,
          borderColor: Colors.white,
          isSelected: [
            selectedGender == 'male',
            selectedGender == 'female',
          ],
          onPressed: (index) {
            setState(() {
              selectedGender = index == 0 ? 'male' : 'female';
              widget.controller.text = selectedGender;
            });
          },
          children: [
            Icon(
              Icons.male,
              color: selectedGender == 'male' ? Colors.white : Colors.grey,
            ),
            Icon(Icons.female,
                color: selectedGender == 'female' ? Colors.white : Colors.grey),
          ],
        ),
      ],
    );
  }
}

// حقل اختيار تاريخ الميلاد
class BirthDateField extends StatefulWidget {
  final TextEditingController agecontroller;
  BirthDateField({required this.agecontroller});
  @override
  _BirthDateFieldState createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<BirthDateField> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.agecontroller.text =
            DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Column(
          children: [
            DefaultTextStyle(
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                child: Text('اختر العمر')),
            IconButton(
              onPressed: () {
                _selectDate(context);
              },
              icon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              tooltip: 'اختر تاريخ الميلاد',
            ),
            DefaultTextStyle(
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                child: Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}')),
          ],
        ),
      ],
    );
  }
}

class Step1 extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController chakepasswordController;
  final TextEditingController phoneController;
  final TextEditingController classController;
  final TextEditingController adrissController;

  const Step1(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.chakepasswordController,
      required this.phoneController,
      required this.classController,
      required this.adrissController})
      : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  bool passwordVisible = false;
  String selectedSemester = 'عاشر علمي';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: widget.emailController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'البريد الالكتروني',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon:
                  Icon(Icons.email, color: Colors.grey.withOpacity(0.9)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: widget.phoneController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'رقم الهاتف',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon:
                  Icon(Icons.phone, color: Colors.grey.withOpacity(0.9)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: widget.passwordController,
            textAlign: TextAlign.right,
            obscureText: passwordVisible,
            decoration: InputDecoration(
              hintText: 'ادخل كلمة المرور',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.password),
              prefixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.withOpacity(0.9),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: widget.chakepasswordController,
            textAlign: TextAlign.right,
            obscureText: !passwordVisible,
            decoration: InputDecoration(
              hintText: 'التأكد من كلمة المرور',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.password),
              prefixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
                child: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey.withOpacity(0.9),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: widget.adrissController,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: 'عنوان المنزل',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              suffixIcon: Icon(Icons.home_outlined,
                  color: Colors.grey.withOpacity(0.9)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: DropdownButton<String>(
              alignment: AlignmentDirectional.center,
              value: selectedSemester,
              hint: Text('اختر الفصل الدراسي'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSemester = newValue!;
                });
              },
              items: <String>[
                'عاشر علمي',
                'حادي عشر علمي',
                'بكلوريا علمي',
                'عاشر أدبي',
                'حادي عشر أدبي',
                'بكلوريا أدبي',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'boutros',
                fontSize: 20,
              ),
              dropdownColor: Colors.deepPurple,
              elevation: 2,
              icon: Icon(Icons.arrow_drop_down),
              iconEnabledColor: Colors.white,
              // isExpanded: true,
              underline: Container(
                height: 0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  File? _profileImage;
  File? _idImage;
  File? _certificateImage;
  String? _profileImageName;
  String? _idImageName;
  String? _certificateImageName;

  Future<void> _pickImage(ImageSource source, String field) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        switch (field) {
          case 'profile':
            _profileImage = File(pickedImage.path);
            _profileImageName = pickedImage.path.split('/').last;
            break;
          case 'id':
            _idImage = File(pickedImage.path);
            _idImageName = pickedImage.path.split('/').last;
            break;
          case 'certificate':
            _certificateImage = File(pickedImage.path);
            _certificateImageName = pickedImage.path.split('/').last;
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery, 'profile'),
            child: Text('تحميل الصورة الشخصية'),
          ),
          SizedBox(
            height: 15,
          ),
          if (_profileImageName != null)
            Text(
              _profileImageName!,
              style: TextStyle(
                color: Colors.white70,
                fontFamily: 'boutros',
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery, 'id'),
            child: Text('تحميل صورة الهوية الضخصية'),
          ),
          SizedBox(
            height: 15,
          ),
          if (_idImageName != null)
            Text(
              _idImageName!,
              style: TextStyle(
                color: Colors.white70,
                fontFamily: 'boutros',
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery, 'certificate'),
            child: Text(' تحميل صورة الشهادة التي تسبق المرحلة الدراسية'),
          ),
          SizedBox(
            height: 15,
          ),
          if (_certificateImageName != null)
            Text(
              _certificateImageName!,
              style: TextStyle(
                color: Colors.white70,
                fontFamily: 'boutros',
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
        ],
      ),
    );
  }
}
