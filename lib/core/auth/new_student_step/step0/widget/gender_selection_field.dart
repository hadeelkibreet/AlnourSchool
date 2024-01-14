import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../providers/select_gender_provider.dart';

// حقل اختيار الجنس
class GenderSelectionField extends ConsumerStatefulWidget {
  GenderSelectionField({
    Key? key,
  });

  @override
  _GenderSelectionFieldState createState() => _GenderSelectionFieldState();
}

class _GenderSelectionFieldState extends ConsumerState<GenderSelectionField> {
  @override
  Widget build(BuildContext context) {
    String selectgender = ref.watch(SelectGenderProvider);

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
            selectgender == 'male',
            selectgender == 'female',
          ],
          onPressed: (index) {
            setState(() {
              selectgender = index == 0 ? 'male' : 'female';
              ref
                  .read(SelectGenderProvider.notifier)
                  .update((state) => selectgender);
            });
          },
          children: [
            Icon(
              Icons.male,
              color: selectgender == 'male' ? Colors.white : Colors.grey,
            ),
            Icon(Icons.female,
                color: selectgender == 'female' ? Colors.white : Colors.grey),
          ],
        ),
      ],
    );
  }
}
