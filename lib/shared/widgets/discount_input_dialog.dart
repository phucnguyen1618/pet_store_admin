import 'package:flutter/material.dart';

class DiscountInputDialog extends StatefulWidget {
  const DiscountInputDialog({super.key});

  @override
  State<DiscountInputDialog> createState() => _DiscountInputDialogState();
}

class _DiscountInputDialogState extends State<DiscountInputDialog> {
  TextEditingController discountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      title: const Text(
        'Set mã giảm giá',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: TextField(
        controller: discountController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Nhập giảm giá:',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Huỷ bỏ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, discountController.text);
          },
          child: const Text(
            'Xác nhận',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }
}
