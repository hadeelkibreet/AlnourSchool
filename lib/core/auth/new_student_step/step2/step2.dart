import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/image_provider.dart';

class Step2 extends ConsumerStatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  ConsumerState<Step2> createState() => _Step2State();
}

class _Step2State extends ConsumerState<Step2> {
  String? filePath;
  String? profileFileName;
  String? idFileName;
  String? certificateFileName;
  bool isTextFieldEnabled = true;

  Future<void> pickFile(String field) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
        switch (field) {
          case 'profile':
            setState(() {
              filePath = result.files.single.path;
              profileFileName = result.files.single.name;
              print('---------------------------------${profileFileName}');
              uploadFileprofile();
            });
            break;
          case 'id':
            setState(() {
              filePath = result.files.single.path;
              idFileName = result.files.single.name;
              uploadFileId();
            });
            break;
          case 'certificate':
            setState(() {
              filePath = result.files.single.path;
              certificateFileName = result.files.single.name;
              uploadFilecertificate();
            });
            break;
        }
      });
    }
  }

  Future<void> uploadFileprofile() async {
    if (filePath != null) {
      File file = File(filePath!);
      print(
          "------------------------*************************-${file.path.split('/').last.toString()}");
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('profile/${file.path.split('/').last}')
            .putFile(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully.')),
        );
        setState(() {
          profileFileName = file.path.split('/').last;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload file.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected.')),
      );
    }
  }

  // Future<void> uploadFileprofile() async {
  //   if (filePath != null) {
  //     File file = File(filePath!);
  //     try {
  //       await firebase_storage.FirebaseStorage.instance
  //           .ref('profile/${file.path.split('/').last}')
  //           .putFile(file);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('File uploaded successfully.')),
  //       );
  //       ref
  //           .read(ProfileImgProvider.notifier)
  //           .update((state) => profileFileName!);
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to upload file.')),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('No file selected.')),
  //     );
  //   }
  // }

  Future<void> uploadFileId() async {
    if (filePath != null) {
      File file = File(filePath!);
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('id/${file.path.split('/').last}')
            .putFile(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully.')),
        );
        ref.read(IdImgProvider.notifier).update((state) => idFileName!);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload file.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected.')),
      );
    }
  }

  Future<void> uploadFilecertificate() async {
    if (filePath != null) {
      File file = File(filePath!);
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('certificate/${file.path.split('/').last}')
            .putFile(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully.')),
        );
        ref
            .read(CertificateImgProvider.notifier)
            .update((state) => certificateFileName!);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload file.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Text(
              ': اختر الصورة الشخصية',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'boutros',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.right,
              onTap: () {
                setState(() {
                  pickFile('profile');
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText:
                    profileFileName == null ? 'اضغط للاختيار' : profileFileName,
                hintStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            const Text(
              ': اختر  صورة الهوية الشخصية',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'boutros',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.right,
              onTap: () {
                setState(() {
                  pickFile('id');
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: idFileName == null ? 'اضغط للاختيار' : idFileName,
                hintStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            const Text(
              ' : اختر صورة الشهادة التي تسبق المرحلة المختارة',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'boutros',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.right,
              onTap: () {
                setState(() {
                  pickFile('certificate');
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: certificateFileName == null
                    ? 'اضغط للاختيار'
                    : certificateFileName,
                hintStyle: TextStyle(color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
