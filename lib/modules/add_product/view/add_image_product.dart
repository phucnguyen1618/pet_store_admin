import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageProduct extends StatefulWidget {
  final String? imageUrl;
  final Function(File) onAdd;
  const AddImageProduct({
    super.key,
    required this.imageUrl,
    required this.onAdd,
  });

  @override
  State<AddImageProduct> createState() => _AddImageProductState();
}

class _AddImageProductState extends State<AddImageProduct> {
  String? image;
  File? imageFile;

  @override
  void initState() {
    image = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return image != null && image!.isNotEmpty
        ? CachedNetworkImage(
            width: 80.0,
            height: 80.0,
            imageUrl: image!,
            imageBuilder: (context, provider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.redAccent,
                  image: DecorationImage(
                    image: provider,
                    fit: BoxFit.cover,
                  )),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : imageFile != null
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
