import 'package:flutter/material.dart';

class RemoveEmployeeDialog extends StatelessWidget {
  const RemoveEmployeeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      title: const Text(
        'Xoá nhân viên ?',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text('Bạn có chắc chắn muốn xoá nhân viên này không ?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Huỷ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'confirm');
          },
          child: const Text(
            'Xác nhận',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
