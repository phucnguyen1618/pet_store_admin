import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/service.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';

class EditServiceBottomSheet extends StatefulWidget {
  final Service service;
  const EditServiceBottomSheet({
    super.key,
    required this.service,
  });

  @override
  State<EditServiceBottomSheet> createState() => _EditServiceBottomSheetState();
}

class _EditServiceBottomSheetState extends State<EditServiceBottomSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  String imageUrl = '';
  bool isEdit = false;

  @override
  void initState() {
    nameController.text = widget.service.name;
    costController.text = AppUtils.formatPrice(widget.service.price);
    imageUrl = widget.service.imageService;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = MediaQuery.of(context).size.width;
    double baseHeight = MediaQuery.of(context).size.height * 0.75;
    return Container(
      height: baseHeight,
      color: Colors.white,
      width: baseWidth,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.grey,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isEdit = !isEdit;
                    });
                  },
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  ))
            ],
          ),
          const SizedBox(height: 16.0),
          RichText(
              text: const TextSpan(
                  text: 'Tên dịch vụ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  children: [
                TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ))
              ])),
          const SizedBox(height: 8.0),
          TextField(
              controller: nameController,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'Nhập tên dịch vụ',
                border: isEdit ? null : InputBorder.none,
              )),
          const SizedBox(height: 24.0),
          RichText(
              text: const TextSpan(
                  text: 'Ảnh dịch vụ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  children: [
                TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ))
              ])),
          const SizedBox(height: 8.0),
          CachedNetworkImage(
            width: 100.0,
            height: 100.0,
            imageUrl: imageUrl,
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
          const SizedBox(height: 24.0),
          RichText(
              text: const TextSpan(
                  text: 'Giá của mỗi loại dịch vụ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  children: [
                TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ))
              ])),
          const SizedBox(height: 8.0),
          TextField(
              controller: costController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'Nhập giá dịch vụ',
                border: isEdit ? null : InputBorder.none,
              )),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'cost': costController.text,
                });
              },
              elevation: 0.0,
              color: Colors.blue,
              child: const Text(
                'Xác nhận',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
