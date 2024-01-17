import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/pending_model.dart';

class PendingService {
  final pendingCollection = FirebaseFirestore.instance.collection('pending');

  //create
  void addpending(PendingModel model) {
    pendingCollection.doc(model.uid).set(model.toMap());
  }
}
