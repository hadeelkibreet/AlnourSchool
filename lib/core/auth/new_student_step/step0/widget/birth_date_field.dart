import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../providers/select_date_provider.dart';

// حقل اختيار تاريخ الميلاد
class BirthDateField extends ConsumerStatefulWidget {
  BirthDateField({
    Key? key,
  });
  @override
  _BirthDateFieldState createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends ConsumerState<BirthDateField> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    late String selectedDateToString = ref.read(selectedDateProvider);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        selectedDateToString = DateFormat('yyyy-MM-dd').format(selectedDate);
        ref
            .read(selectedDateProvider.notifier)
            .update((state) => selectedDateToString);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    late String selectedDate = ref.read(selectedDateProvider);

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
                child: Text('$selectedDate')),
          ],
        ),
      ],
    );
  }
}
