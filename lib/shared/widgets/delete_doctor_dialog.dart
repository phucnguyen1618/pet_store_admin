import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/doctor.dart';

class DeleteDoctorDialog extends StatelessWidget {
  final Doctor doctor;
  const DeleteDoctorDialog({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Xoá bác sĩ này ?',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Bạn có chắc chắn muốn xoá bác sĩ này không ?',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Huỷ'.toUpperCase(),
            style: const TextStyle(
              color: Colors.black38,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'confirm');
          },
          child: Text('Xác nhận'.toUpperCase()),
        )
      ],
    );
  }
}
