import 'package:alnour/core/auth/new_student_step/step1/widget/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1 extends ConsumerStatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController checkpasswordController;
  final TextEditingController phoneController;
  final TextEditingController adrissController;

  const Step1(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.checkpasswordController,
      required this.phoneController,
      required this.adrissController})
      : super(key: key);

  @override
  ConsumerState<Step1> createState() => _Step1State();
}

class _Step1State extends ConsumerState<Step1> {
  bool passwordVisible = false;
  bool checkpasswordVisible = false;

  final GlobalKey _formkey = GlobalKey<FormState>();

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
            obscureText: !passwordVisible,
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
          Form(
            key: _formkey,
            child: TextField(
              controller: widget.checkpasswordController,
              onChanged: (value) {},
              textAlign: TextAlign.right,
              obscureText: !checkpasswordVisible,
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
                      checkpasswordVisible = !checkpasswordVisible;
                    });
                  },
                  child: Icon(
                    checkpasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey.withOpacity(0.9),
                  ),
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
          DropDownCls(),
        ],
      ),
    );
  }
}
