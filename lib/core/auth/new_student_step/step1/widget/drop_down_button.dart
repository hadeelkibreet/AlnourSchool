import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../providers/select_cls_provider.dart';

class DropDownCls extends ConsumerStatefulWidget {
  const DropDownCls({Key? key}) : super(key: key);

  @override
  ConsumerState<DropDownCls> createState() => _DropDownClsState();
}

class _DropDownClsState extends ConsumerState<DropDownCls> {
  @override
  Widget build(BuildContext context) {
    String selectedSemester = ref.read(ClsProvider);

    return Container(
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
            ref.read(ClsProvider.notifier).update((state) => selectedSemester);
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
    );
  }
}
