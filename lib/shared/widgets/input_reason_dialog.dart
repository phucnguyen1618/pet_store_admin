import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class InputReasonDialog extends StatelessWidget {
  const InputReasonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController reasonController = TextEditingController();
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      title: const Text(
        'Tại sao lại huỷ đặt lịch này ?',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Bạn có chắc chắn muốn huỷ đơn đặt lịch này ?'),
          const SizedBox(height: 8.0),
          TextField(
              controller: reasonController,
              decoration:
                  const InputDecoration(hintText: 'Nhập lý do ở đây...')),
        ],
      ),
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
            if (reasonController.text.isNotEmpty) {
              Navigator.pop(context, reasonController.text);
            } else {
              EasyLoading.showToast('Bạn cần phải có lý do huỷ đặt lịch');
            }
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
