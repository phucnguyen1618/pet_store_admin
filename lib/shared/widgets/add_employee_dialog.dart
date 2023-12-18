import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEmployeeDialog extends StatefulWidget {
  const AddEmployeeDialog({super.key});

  @override
  State<AddEmployeeDialog> createState() => _AddEmployeeDialogState();
}

class _AddEmployeeDialogState extends State<AddEmployeeDialog> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
      title: const Text(
        'Thêm nhân viên',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Form(
        key: globalKey,
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) => value == null || value.isEmpty ? 'Email là bắt buộc' : null,
                decoration: const InputDecoration(
                  hintText: 'Nhập email',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black38,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: nameController,
                validator: (value) => value == null || value.isEmpty ? 'Họ và tên là bắt buộc' : null,
                decoration: const InputDecoration(
                  hintText: 'Nhập họ và tên',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            if(globalKey.currentState!.validate()) {
              Navigator.pop(context, {
                "email": emailController.text,
                "name": nameController.text,
              });
            }
          },
          color: Colors.blue,
          elevation: 0.0,
          disabledElevation: 0.0,
          child: const Text(
            'Thêm nhân viên',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
