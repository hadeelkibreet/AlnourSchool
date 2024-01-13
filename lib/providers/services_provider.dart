import 'package:alnour/services/student_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final servieceProvider = StateProvider<StudentService>((ref) {
  return StudentService();
});
