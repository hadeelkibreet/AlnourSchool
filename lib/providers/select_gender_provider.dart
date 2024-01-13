import 'package:flutter_riverpod/flutter_riverpod.dart';

final SelectGenderProvider = StateProvider<String>((ref) {
  return 'male';
});
