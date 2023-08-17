import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  const InputImage({
    super.key, required this.choice,
  });
  final ImageSource choice;
//final void Function(DocumentSnapshot<Map<String, dynamic>>user)userData;
  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File? pickedImage;
  DocumentSnapshot<Map<String, dynamic>>? user;
  void getImage() async {
    final image = await ImagePicker().pickImage(
      source: widget.choice,
      imageQuality: 100,
      maxWidth: 150,
    );
    if (image == null) {
      return;
    }
    setState(() {
      pickedImage = File(image.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [CircleAvatar(
            radius: 45,
            //backgroundColor: Colors.grey,
            backgroundImage:
                pickedImage != null ? FileImage(pickedImage!) : null,
          ),
          GestureDetector(
            onTap: getImage,
            child: const CircleAvatar(
              radius: 15,
              child: Icon(Icons.add),
            ),
          )
          ]
        ),
      ],
    );
  }
}
