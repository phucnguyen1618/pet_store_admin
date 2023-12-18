import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ChooseBirthDayDialog extends StatelessWidget {
  final Function(DateTime) onChoose;

  const ChooseBirthDayDialog({super.key, required this.onChoose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      title: const Text(
        'Chọn ngày sinh',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: Get.height * 0.5,
        width: Get.width,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          dateOrder: DatePickerDateOrder.dmy,
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (value) {
            if (value.isAfter(DateTime.now())) {
              EasyLoading.showToast('Ngày sinh này không hợp lệ');
            } else {
              onChoose(value);
            }
          },
        ),
      ),
    );
  }
}
