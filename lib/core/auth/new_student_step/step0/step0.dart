import 'package:alnour/core/auth/new_student_step/step0/widget/birth_date_field.dart';
import 'package:alnour/core/auth/new_student_step/step0/widget/gender_selection_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step0 extends ConsumerWidget {
  final TextEditingController nameController;
  final TextEditingController fathernameController;
  final TextEditingController mathernameController;
  final TextEditingController lastnameController;

  const Step0({
    Key? key,
    required this.nameController,
    required this.fathernameController,
    required this.mathernameController,
    required this.lastnameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
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
              BirthDateField(),
              // SizedBox(width: 15,),
              // إضافة حقل اختيار الجنس
              GenderSelectionField(),
            ],
          ),
        ],
      ),
    );
  }
}
