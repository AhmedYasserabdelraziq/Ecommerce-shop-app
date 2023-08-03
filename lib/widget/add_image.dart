import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
  const InputImage({
    super.key, required this.userData,
  });
final void Function(DocumentSnapshot<Map<String, dynamic>>user)userData;
  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File? pickedImage;
  DocumentSnapshot<Map<String, dynamic>>? user;
  @override
  void initState() {
    getDataFromFirebase();
    super.initState();
  }
  void getImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    if (image == null) {
      return;
    }
    setState(() {
      pickedImage = File(image.path);
    });


  }
  void getDataFromFirebase()async{
    final userr = FirebaseAuth.instance.currentUser!;
    final userData =
    await FirebaseFirestore.instance.collection('user').doc(userr.uid).get();
    setState(() {
      user=userData;
  });
    widget.userData(user!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: getImage,
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey,
            foregroundImage:
                pickedImage != null ? FileImage(pickedImage!) : null,
          ),
        ),
      ],
    );
  }
}
