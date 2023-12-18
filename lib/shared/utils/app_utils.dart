import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_store_admin/shared/constants/app_constants.dart';

class AppUtils {
  static String formatPrice(double value) {
    return NumberFormat('#,###').format(value);
  }

  static String formatBookingDateTime(DateTime dateTime) {
    return DateFormat(AppConstants.DATETIME_BOOKING_FORMAT).format(dateTime);
  }

  static String formatOrderDateTime(DateTime dateTime) {
    return DateFormat(AppConstants.ORDER_BOOKING_FORMAT).format(dateTime);
  }

  static String formatBirthdayDateTime(DateTime dateTime) {
    return DateFormat(AppConstants.DATETIME_BOOKING_FORMAT).format(dateTime);
  }

  static String generateNameAvatar(String fullName) {
    String nameAvatar = '';
    if (fullName.length > 1) {
      final splitted = fullName.split(' ');
      for (var str in splitted) {
        nameAvatar = nameAvatar + str.substring(0, 1);
      }
    } else if (nameAvatar.length == 1) {
      nameAvatar = fullName.characters.first;
    }
    return nameAvatar;
  }

  static String formatOrderStatus(int value) {
    switch (value) {
      case 0:
        return 'Đang chờ xác nhận';
      case 1:
        return 'Đã hoàn thành';
      case 2:
        return 'Đã huỷ';
      default:
        return 'Đang chờ xác nhận';
    }
  }

  static String generateTitleOrderStatus(int value) {
    switch (value) {
      case 0:
        return 'Đang chờ xác nhận';
      case 1:
        return 'Đã hoàn thành';
      case 2:
        return 'Đã huỷ';
      default:
        return 'Tất cả';
    }
  }

  static Color mapColorByOrderStatus(int value) {
    switch (value) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.green;
      case 2:
        return Colors.red;
      default:
        return Colors.orange;
    }
  }
}
