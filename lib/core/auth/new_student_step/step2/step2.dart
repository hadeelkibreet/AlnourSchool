import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  final TextEditingController imageController;

  const Step2({Key? key, required this.imageController}) : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  // File? _profileImage;
  // File? _idImage;
  // File? _certificateImage;
  // String? _profileImageName;
  // String? _idImageName;
  // String? _certificateImageName;
  // String imageUrl = '';
  // Future<void> _pickImage(ImageSource source, String field) async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: source);
  //
  //   if (pickedImage != null) {
  //     switch (field) {
  //       case 'profile':
  //         _profileImage = File(pickedImage.path);
  //         _profileImageName = pickedImage.path.split('/').last;
  //         widget.imageController.text = _profileImageName!;
  //         break;
  //       case 'id':
  //         _idImage = File(pickedImage.path);
  //         _idImageName = pickedImage.path.split('/').last;
  //         break;
  //       case 'certificate':
  //         _certificateImage = File(pickedImage.path);
  //         _certificateImageName = pickedImage.path.split('/').last;
  //         break;
  //     }
  //
  //     // Perform the asynchronous image upload
  //     await _uploadImagesToFirebaseStorage();
  //
  //     // Update the widget state synchronously
  //     setState(() {});
  //   }
  // }
  //
  // Future<void> _uploadImagesToFirebaseStorage() async {
  //   firebase_storage.Reference storageRef =
  //       firebase_storage.FirebaseStorage.instance.ref().child('images');
  //   if (_profileImage != null) {
  //     String fileName = path.basename(_profileImage!.path);
  //     firebase_storage.Reference profileImageRef =
  //         storageRef.child('profile/$fileName');
  //     await profileImageRef.putFile(_profileImage!);
  //   }
  //
  //   if (_idImage != null) {
  //     String fileName = path.basename(_idImage!.path);
  //     firebase_storage.Reference idImageRef = storageRef.child('id/$fileName');
  //     await idImageRef.putFile(_idImage!);
  //   }
  //
  //   if (_certificateImage != null) {
  //     String fileName = path.basename(_certificateImage!.path);
  //     firebase_storage.Reference certificateImageRef =
  //         storageRef.child('certificate/$fileName');
  //     await certificateImageRef.putFile(_certificateImage!);
  //   }

  // Images uploaded successfully
  //}
  // Future<void> _pickImage(ImageSource source, String field) async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: source);
  //   if (pickedImage != null) {
  //     setState(() async {
  //       switch (field) {
  //         case 'profile':
  //           _profileImage = File(pickedImage.path);
  //           print('$_profileImage');
  //           Reference referenceRoot = FirebaseStorage.instance.ref();
  //           Reference referenceDirImages = referenceRoot.child('images');
  //           Reference referenceImageToUpload =
  //               referenceDirImages.child('$_profileImage');
  //
  //           try {
  //             await referenceImageToUpload
  //                 .putFile(File(_profileImage as String));
  //             imageUrl =
  //                 await referenceImageToUpload.getDownloadURL() as String;
  //           } catch (error) {}
  //
  //           _profileImageName = pickedImage.path.split('/').last;
  //           widget.imageController.text = _profileImageName!;
  //           break;
  //         case 'id':
  //           _idImage = File(pickedImage.path);
  //           _idImageName = pickedImage.path.split('/').last;
  //           break;
  //         case 'certificate':
  //           _certificateImage = File(pickedImage.path);
  //           _certificateImageName = pickedImage.path.split('/').last;
  //           break;
  //       }
  //     });
  //   }
  // }
  // PlatformFile? pickedFile;
  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   // if (result == null) {
  //   //   return;
  //   // }
  //   setState(() {
  //     pickedFile = result!.files.first;
  //   });
  // }
  //
  // Future UploadFile() async {
  //   final path = 'img/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);
  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   ref.putFile(file);
  // }

  String? filePath;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        filePath = result.files.single.path;
      });
    }
  }

  Future<void> uploadFile() async {
    if (filePath != null) {
      File file = File(filePath!);
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('uploads/${file.path.split('/').last}')
            .putFile(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully.')),
        );
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  pickFile();
                },
                child: Text(''),
              )),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    uploadFile();
                  },
                  //_pickImage(ImageSource.gallery, 'profile'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('تحميل الصورة الشخصية'),
                      //Text('${pickedFile!.name}'),
                      // if (_profileImageName != null)
                      //   Text(
                      //     _profileImageName!,
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontFamily: 'boutros',
                      //       fontSize: 16,
                      //     ),
                      //     overflow: TextOverflow.ellipsis,
                      //     maxLines: 1,
                      //   ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 15,
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: ElevatedButton(
          //         onPressed: () => _pickImage(ImageSource.gallery, 'id'),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.end,
          //           children: [
          //             Text('تحميل صورة الهوية الشخصية'),
          //             if (_idImageName != null)
          //               Text(
          //                 _idImageName!,
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontFamily: 'boutros',
          //                   fontSize: 16,
          //                 ),
          //                 overflow: TextOverflow.ellipsis,
          //                 maxLines: 1,
          //               ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 25,
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: ElevatedButton(
          //         onPressed: () =>
          //             _pickImage(ImageSource.gallery, 'certificate'),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.end,
          //           children: [
          //             Text(' تحميل صورة الشهادة التي تسبق المرحلة الدراسية'),
          //             if (_certificateImageName != null)
          //               Text(
          //                 _certificateImageName!,
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontFamily: 'boutros',
          //                   fontSize: 16,
          //                 ),
          //                 overflow: TextOverflow.ellipsis,
          //                 maxLines: 1,
          //               ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
