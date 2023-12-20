import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/models/doctor.dart';
import 'package:pet_store_admin/models/product.dart';
import 'package:pet_store_admin/models/service.dart';
import 'package:pet_store_admin/shared/widgets/add_employee_dialog.dart';
import 'package:pet_store_admin/shared/widgets/choose_birthday_dialog.dart';
import 'package:pet_store_admin/shared/widgets/delete_doctor_dialog.dart';
import 'package:pet_store_admin/shared/widgets/delete_product_dialog.dart';
import 'package:pet_store_admin/shared/widgets/delete_service_dialog.dart';
import 'package:pet_store_admin/shared/widgets/discount_input_dialog.dart';
import 'package:pet_store_admin/shared/widgets/input_reason_dialog.dart';
import 'package:pet_store_admin/shared/widgets/sign_out_dialog.dart';

import '../widgets/remove_employee_dialog.dart';

class DialogUtils {
  static void showSignOutDialog(Function() onSignOut) {
    showDialog(
      context: Get.context!,
      builder: (context) => const SignOutDialog(),
    ).then((value) {
      if (value != null) {
        onSignOut();
      }
    });
  }

  static void showDeleteProductDialog(
    Product product,
    Function(String) onDelete,
  ) {
    showDialog(
      context: Get.context!,
      builder: (context) => DeleteProductDialog(product: product),
    ).then((value) {
      if (value != null) {
        onDelete(value);
      }
    });
  }

  static void showDiscountInputDialog(
    Function(double) onConfirm,
  ) {
    showDialog(
      context: Get.context!,
      builder: (context) => const DiscountInputDialog(),
    ).then((value) {
      if (value != null) {
        double discount = double.parse(value);
        onConfirm(discount);
      }
    });
  }

  static void showDeleteServiceDialog(
    Service service,
    Function(String) onDelete,
  ) {
    showDialog(
      context: Get.context!,
      builder: (context) => DeleteServiceDialog(service: service),
    ).then((value) {
      if (value != null) {
        onDelete(value);
      }
    });
  }

  static void showInputReasonDialog(Function(String) onConfirm) {
    showDialog(
      context: Get.context!,
      builder: (context) => const InputReasonDialog(),
    ).then((value) {
      if (value != null) {
        onConfirm(value);
      }
    });
  }

  static void showAddEmployeeDialog(Function(String, String) onAdd) {
    showDialog(
      context: Get.context!,
      builder: (context) => const AddEmployeeDialog(),
    ).then((value) {
      if (value != null) {
        String email = value['email'];
        String name = value['name'];
        onAdd(email, name);
      }
    });
  }

  static void showRemoveEmployeeDialog(Function() onConfirm) {
    showDialog(
      context: Get.context!,
      builder: (context) => const RemoveEmployeeDialog(),
    ).then((value) {
      if (value != null) {
        onConfirm();
      }
    });
  }

  static void showChooseBirthDayDialog(Function(DateTime) onChoose) {
    showDialog(
      context: Get.context!,
      builder: (context) => ChooseBirthDayDialog(
        onChoose: (dateTime) {
          onChoose(dateTime);
        },
      ),
    );
  }

  static void showChooseDateTimeDialog(Function(DateTime) onChoose) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        title: const Text(
          'Chọn thời gian',
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
              onChoose(value);
            },
          ),
        ),
      ),
    );
  }

  static void showDeleteDoctorDialog(
    Doctor doctor,
    Function() onDelete,
  ) {
    showDialog(
      context: Get.context!,
      builder: (context) => DeleteDoctorDialog(doctor: doctor),
    ).then((value) {
      if (value != null) {
        onDelete();
      }
    });
  }
}
