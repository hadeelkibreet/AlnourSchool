import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/pending_model.dart';
import '../model/student_model.dart';

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
}
