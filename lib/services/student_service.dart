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

  final ClsCollection = FirebaseFirestore.instance.collection('cls');

// Add field to document
  void addFieldToClsDocument(
      String documentId, String fieldName, String fieldValue) {
    ClsCollection.doc(documentId).update({
      fieldName: fieldValue,
    });
  }
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

final fetchStreamProvider =
    StreamProvider.autoDispose<StudentModel>((ref) async* {
  final db = FirebaseFirestore.instance;
  final uid = ref.read(UidProvider);
  final docRef = db.collection("newstudent").doc(uid);

  yield* docRef.snapshots().map((snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final student = StudentModel.fromMap(data ?? {});
    return student;
  });
});
