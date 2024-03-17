import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/pending_model.dart';
import '../model/student_model.dart';
import '../providers/uid_provider.dart';

class StudentService {
  final studentCollection = FirebaseFirestore.instance.collection('newstudent');

  //create
  void addstudent(StudentModel model) {
    studentCollection.doc(model.uid).set(model.toMap());
    // studentCollection.add(model.toMap());
  }

  final pendingCollection = FirebaseFirestore.instance.collection('pending');

  void addpending(PendingModel model) {
    pendingCollection.doc(model.uid).set(model.toMap());
  }

  //get data

  // final fetchStreamProvider = StreamProvider<StudentModel>((ref) async* {
  //   String uid = ref.read(
  //       UidProvider); // استبدل 'your_uid' بالـ uid الخاص بالمستخدم المطلوب
  //
  //   final getData = FirebaseFirestore.instance
  //       .collection('newstudent')
  //       .where('uid', isEqualTo: uid) // تصفية النتائج بناءً على الـ uid
  //       .snapshots()
  //       .map((event) => event.docs
  //           .map((snapshot) => StudentModel.fromSnapshot(snapshot))
  //           .first); // استرجاع الطالب الوحيد
  //
  //   yield* getData;
  // });

  // final studentProvider =
  //     FutureProvider.family<StudentModel, String>((ref, studentId) async {
  //   // Replace 'students' with the actual collection name in Firestore
  //   final document =
  //       FirebaseFirestore.instance.collection('newstudent').doc(studentId);
  //
  //   final snapshot = await document.get();
  //   if (snapshot.exists) {
  //     return StudentModel.fromSnapshot(snapshot);
  //   } else {
  //     throw Exception('Student not found');
  //   }
  // });
}

// استدعاء معلومات الطالب باستخدام UID
Future<void> fetchStudentInformation(String uid) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('newstudent')
        .doc(uid)
        .get();

    if (snapshot.exists) {
      StudentModel student = StudentModel.fromSnapshot(snapshot);

      // استخدم معلومات الطالب هنا
      print('اسم الطالب: ${student.name}');
      print('البريد الإلكتروني: ${student.email}');
      // وهكذا...
    } else {
      print('الطالب غير موجود');
    }
  } catch (e) {
    print('حدث خطأ أثناء استدعاء المعلومات: $e');
  }
}

final fetchStreamProvider = StreamProvider.autoDispose<StudentModel>((ref) {
  final db = FirebaseFirestore.instance;
  final uid = ref.read(UidProvider);
  final docRef = db.collection("newstudent").doc(uid);

  return docRef.snapshots().map((snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final student = StudentModel.fromMap(data);
    return student;
  });
});
//زبط شي
// final fetchStreamProvider = StreamProvider<StudentModel>((ref) {
//   final db = FirebaseFirestore.instance;
//   final uid = ref.read(UidProvider);
//   final docRef = db.collection("newstudent").doc(uid);
//
//   return docRef.snapshots().map((snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;
//     final student = StudentModel.fromMap(data);
//
//     return student;
//   });
// });

// final fetchStreamProvider = StreamProvider<StudentModel>((ref) async* {
//   final db = FirebaseFirestore.instance;
//   final uid = ref.read(UidProvider);
//   final docRef = db.collection("newstudent").doc(uid);
//   final snapshot = await docRef.get();
//   if (snapshot.exists) {
//     final data = snapshot.data() as Map<String, dynamic>;
//     final student = StudentModel.fromMap(data);
//     print(data.toString());
//     print('------------------------------------------------------------------');
//     print(student.toString());
//     yield student;
//   } else {
//     onError:
//     (e) => print("Error getting document: $e");
//   }
// });

//////////////////////////////////////////////////////////////////////////////////

// final fetchStreamProvider = StreamProvider<StudentModel>((ref) async* {
//   final getData = FirebaseFirestore.instance
//       .collection('newstudent')
//       .snapshots()
//       .map((event) => event.docs
//           .map((snapshot) => StudentModel.fromSnapshot(snapshot))
//           .first);
//   yield* getData;
// });
