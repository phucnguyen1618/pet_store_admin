import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/account.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';

class ItemEmployee extends StatelessWidget {
  final Account account;
  final Function(String) onDelete;

  const ItemEmployee({
    super.key,
    required this.account,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
      leading: Container(
        width: 50.0,
        height: 50.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: Text(
          AppUtils.generateNameAvatar(account.name).toUpperCase(),
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        account.name,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        account.email,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black38,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: TextButton(
          onPressed: () {
            onDelete(account.id);
          },
          child: const Text(
            'Xoá',
            style: TextStyle(color: Colors.redAccent),
          )),
    );
  }
}
