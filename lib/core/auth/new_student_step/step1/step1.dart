import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1 extends ConsumerStatefulWidget {
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
  ConsumerState<Step1> createState() => _Step1State();
}

class _Step1State extends ConsumerState<Step1> {
  bool passwordVisible = false;
  String selectedSemester = 'عاشر علمي';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
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
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
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
                  child: Center(
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white),
                    ),
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
