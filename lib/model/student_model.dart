import 'package:alnour/enums/student_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  String? uid;
  final String age;
  final String adriss;
  final String cls;
  final String email;
  final String fathername;
  final String lastname;
  final String mathername;
  final String name;
  final String password;
  final StudentStatus Accept;
  final String phone;
  final String gender;
  final String profileimg;
  final String idimg;
  final String certificateimg;

  StudentModel({
    required this.age,
    this.uid,
    required this.adriss,
    required this.cls,
    required this.email,
    required this.fathername,
    required this.lastname,
    required this.mathername,
    required this.name,
    required this.password,
    required this.Accept,
    required this.phone,
    required this.gender,
    required this.profileimg,
    required this.certificateimg,
    required this.idimg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "Accept": Accept.id,
      "adriss": adriss,
      "age": age,
      "cls": cls,
      "email": email,
      "fathername": fathername,
      "lastname": lastname,
      "mathername": mathername,
      "name": name,
      "password": password,
      "phone": phone,
      "gender": gender,
      "uid": uid,
      "profileimg": profileimg,
      "idimg": idimg,
      "certificateimg": certificateimg,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
        profileimg: map['profileimg'] as String,
        idimg: map['idimg'] as String,
        certificateimg: map['certificateimg'] as String,
        adriss: map['adriss'] as String,
        age: map['age'] as String,
        cls: map['cls'] as String,
        email: map['email'] as String,
        fathername: map['fathername'] as String,
        lastname: map['lastname'] as String,
        mathername: map['mathername'] as String,
        name: map['name'] as String,
        password: map['password'] as String,
        Accept: getStudentStates(map['Accept'] as int),
        phone: map['phone'] as String,
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
      lastname: doc['lastname'],
      mathername: doc['mathername'],
      name: doc['name'],
      password: doc['password'],
      Accept: getStudentStates(doc['Accept'] as int),
      phone: doc['phone'],
      gender: doc['gender'],
      profileimg: doc['profileimg'],
      idimg: doc['idimg'],
      certificateimg: doc['certificateimg'],
    );
  }

  static StudentStatus getStudentStates(int index) {
    switch (index) {
      case 0:
        return StudentStatus.rejected;
      case 1:
        return StudentStatus.pending;
      case 2:
        return StudentStatus.accepted;
    }
    return StudentStatus.unknown;
  }
}
