import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/service.dart';

class DeleteServiceDialog extends StatelessWidget {
  final Service service;
  const DeleteServiceDialog({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      title: const Text(
        'Xoá dịch vụ ?',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CachedNetworkImage(
            width: 30.0,
            height: 30.0,
            imageUrl: service.imageService,
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
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: RichText(
                text: TextSpan(
                    text: 'Bạn có chắc chắn muốn xoá dịch vụ ',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: [
                  TextSpan(
                      text: service.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  const TextSpan(
                      text: ' không ?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ))
                ])),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Huỷ bỏ'.toUpperCase(),
              style: const TextStyle(color: Colors.black26),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context, service.idService);
            },
            child: Text(
              'Xác nhận'.toUpperCase(),
              style: const TextStyle(color: Colors.blue),
            )),
      ],
    );
  }
}
