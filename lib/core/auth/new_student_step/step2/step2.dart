import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  File? _profileImage;
  File? _idImage;
  File? _certificateImage;
  String? _profileImageName;
  String? _idImageName;
  String? _certificateImageName;

  Future<void> _pickImage(ImageSource source, String field) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        switch (field) {
          case 'profile':
            _profileImage = File(pickedImage.path);
            _profileImageName = pickedImage.path.split('/').last;
            break;
          case 'id':
            _idImage = File(pickedImage.path);
            _idImageName = pickedImage.path.split('/').last;
            break;
          case 'certificate':
            _certificateImage = File(pickedImage.path);
            _certificateImageName = pickedImage.path.split('/').last;
            break;
        }
      });
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
                  onPressed: () => _pickImage(ImageSource.gallery, 'profile'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('تحميل الصورة الشخصية'),
                      if (_profileImageName != null)
                        Text(
                          _profileImageName!,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'boutros',
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery, 'id'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('تحميل صورة الهوية الشخصية'),
                      if (_idImageName != null)
                        Text(
                          _idImageName!,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'boutros',
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () =>
                      _pickImage(ImageSource.gallery, 'certificate'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(' تحميل صورة الشهادة التي تسبق المرحلة الدراسية'),
                      if (_certificateImageName != null)
                        Text(
                          _certificateImageName!,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'boutros',
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
