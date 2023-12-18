import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/service.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';
import 'package:pet_store_admin/shared/utils/dialog_utils.dart';

class ItemService extends StatelessWidget {
  final Service service;
  final Function(Service) onEdit;
  final Function(String) onDelete;

  const ItemService({
    super.key,
    required this.service,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: service.imageService,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      title: Text(
        service.name,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Text(AppUtils.formatPrice(service.price))),
          TextButton(
            onPressed: () {
              onEdit(service);
            },
            child: const Text(
              'Chỉnh sửa',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.blue,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                DialogUtils.showDeleteServiceDialog(service, (id) {
                  onDelete(id);
                });
              },
              alignment: Alignment.topCenter,
              icon: Icon(
                Icons.delete,
                color: Colors.grey.shade400,
              ))
        ],
      ),
    );
  }
}
