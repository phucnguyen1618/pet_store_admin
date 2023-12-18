import 'package:flutter/material.dart';

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      title: const Text(
        'Đăng xuất ?',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text('Bạn có chắc chắn muốn đăng xuất không ?',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          )),
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
              Navigator.pop(context, 'confirm');
            },
            child: Text(
              'Xác nhận'.toUpperCase(),
              style: const TextStyle(color: Colors.blue),
            )),
      ],
    );
  }
}
