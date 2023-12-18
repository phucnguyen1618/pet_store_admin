import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageDoctor extends StatefulWidget {
  final Function(File) onAdd;
  const AddImageDoctor({
    super.key,
    required this.onAdd,
  });

  @override
  State<AddImageDoctor> createState() => _AddImageDoctorState();
}

class _AddImageDoctorState extends State<AddImageDoctor> {
  
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return imageFile != null
        ? Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.black12,
                image: DecorationImage(
                  image: FileImage(imageFile!),
                  fit: BoxFit.cover,
                )),
          )
        : Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.black12,
            ),
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () {
                  chooseImage();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                )),
          );
  }

  Future<void> chooseImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
        widget.onAdd(imageFile!);
      });
    }
  }
}
