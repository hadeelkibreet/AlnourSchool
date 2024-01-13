import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDateProvider = StateProvider<String>((ref) {
  return '2024-01-05';
});
