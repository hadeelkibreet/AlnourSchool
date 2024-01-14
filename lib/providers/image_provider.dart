import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

final firebaseStorageRef = firebase_storage.FirebaseStorage.instance.ref();

void uploadFileToFirebaseStorage(String filePath) async {
  File file = File(filePath);
  String fileName = basename(file.path);
  firebase_storage.Reference storageRef = firebaseStorageRef.child(fileName);

  await storageRef.putFile(file);
}
