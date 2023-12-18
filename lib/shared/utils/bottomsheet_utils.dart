import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/service.dart';
import 'package:pet_store_admin/shared/widgets/edit_service_bottomsheet.dart';

class BottomSheetUtils {
  static void showBottomSheetEditService(
    Service service,
    BuildContext context,
    Function(dynamic) onEdit,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => EditServiceBottomSheet(service: service),
    ).then((value) {
      if (value != null) {
        onEdit(value);
      }
    });
  }
}
