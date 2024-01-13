import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  String? uid;
  final String age;
  final String adriss;
  final String cls;
  final String email;
  final String fathername;
  final String image;
  final String lastname;
  final String mathername;
  final String name;
  final String password;
  final bool Accept;
  final int phone;
  final String gender;

  StudentModel(
      {required this.age,
      this.uid,
      required this.adriss,
      required this.cls,
      required this.email,
      required this.fathername,
      required this.image,
      required this.lastname,
      required this.mathername,
      required this.name,
      required this.password,
      required this.Accept,
      required this.phone,
      required this.gender});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "Accept": Accept,
      "adriss": adriss,
      "age": age,
      "cls": cls,
      "email": email,
      "fathername": fathername,
      "image": image,
      "lastname": lastname,
      "mathername": mathername,
      "name": name,
      "password": password,
      "phone": phone,
      "gender": gender,
      "uid": uid
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
        adriss: map['adriss'] as String,
        age: map['age'] as String,
        cls: map['cls'] as String,
        email: map['email'] as String,
        fathername: map['fathername'] as String,
        image: map['image'] as String,
        lastname: map['lastname'] as String,
        mathername: map['mathername'] as String,
        name: map['name'] as String,
        password: map['password'] as String,
        Accept: map['Accept'] as bool,
        phone: map['phone'] as int,
        gender: map['gender'] as String,
        uid: map['uid'] != null ? map['uid'] as String : null);
  }

  factory StudentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return StudentModel(
        uid: doc.id,
        age: doc['age'],
        adriss: doc['adriss'],
        cls: doc['cls'],
        email: doc['email'],
        fathername: doc['fathername'],
        image: doc['image'],
        lastname: doc['lastname'],
        mathername: doc['mathername'],
        name: doc['name'],
        password: doc['password'],
        Accept: doc['Accept'],
        phone: doc['phone'],
        gender: doc['gender']);
  }
}
