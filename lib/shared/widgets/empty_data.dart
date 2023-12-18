import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final EmptyDataType type;
  final Function() onClick;

  const EmptyData({
    super.key,
    required this.type,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case EmptyDataType.productListEmpty:
        return const Center(
          child: Text(
            'Danh sách sản phẩm rỗng',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      case EmptyDataType.serviceListEmpty:
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Hiện không có dịch vụ nào',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              ButtonTheme(
                height: 42.0,
                child: MaterialButton(
                  onPressed: () {
                    onClick();
                  },
                  color: Colors.blue,
                  elevation: 0.0,
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Thêm dịch vụ',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
    }
  }
}

enum EmptyDataType { productListEmpty, serviceListEmpty }
