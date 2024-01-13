import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Step0 extends ConsumerWidget {
  final TextEditingController nameController;
  final TextEditingController fathernameController;
  final TextEditingController mathernameController;
  final TextEditingController lastnameController;
  final TextEditingController genderController;
  final TextEditingController ageController;

  const Step0({
    Key? key,
    required this.nameController,
    required this.fathernameController,
    required this.mathernameController,
    required this.genderController,
    required this.ageController,
    required this.lastnameController,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final selectgender = ref.read(SelectGenderProvider);

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
              BirthDateField(
                agecontroller: ageController,
              ),
              // SizedBox(width: 15,),
              // إضافة حقل اختيار الجنس
              GenderSelectionField(
                controller: genderController,
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
