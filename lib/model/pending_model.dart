import 'package:cloud_firestore/cloud_firestore.dart';

class PendingModel {
  final String uid;

  PendingModel({
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "uid": uid,
    };
  }

  factory PendingModel.fromMap(Map<String, dynamic> map) {
    return PendingModel(
      uid: map['uid'] as String,
    );
  }

  factory PendingModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return PendingModel(
      uid: doc.id,
    );
  }
}
