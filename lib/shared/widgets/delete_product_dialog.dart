import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/product.dart';

class DeleteProductDialog extends StatelessWidget {
  final Product product;

  const DeleteProductDialog({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      title: Text(
        'Xoá sản phẩm ?'.toUpperCase(),
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: RichText(
          text: TextSpan(
              text: 'Bạn có chắc chắn muốn xoá sản phẩm ',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: [
            TextSpan(
                text: product.name,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                )),
            const TextSpan(
                text: ' không ?',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ))
          ])),
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
              Navigator.pop(context, product.idProduct);
            },
            child: Text(
              'Xác nhận'.toUpperCase(),
              style: const TextStyle(color: Colors.blue),
            )),
      ],
    );
  }
}
