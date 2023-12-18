import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/models/doctor.dart';
import 'package:pet_store_admin/routes/app_routes.dart';
import 'package:pet_store_admin/shared/utils/dialog_utils.dart';

class ItemDoctor extends StatelessWidget {
  final Doctor doctor;
  final Function(String) onDelete;
  const ItemDoctor({
    super.key,
    required this.doctor,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    int age = DateTime.now().difference(doctor.birthDay).inDays ~/ 365;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ID: ${doctor.id}',
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black38,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: 100.0,
                height: 100.0,
                imageUrl: doctor.avatar,
                imageBuilder: (context, provider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.blue,
                      image: DecorationImage(
                        image: provider,
                        fit: BoxFit.cover,
                      )),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    doctor.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$age tuổi',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        'Giới tính: ${doctor.sex == 0 ? 'Nam' : 'Nữ'}',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Số năm kinh nghiệm: ${doctor.experience} năm',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black38,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: () {
                  DialogUtils.showDeleteDoctorDialog(doctor, () {
                    onDelete(doctor.id);
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Xoá bác sĩ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.addDoctorPage, arguments: doctor);
                },
                child: const Text(
                  'Chỉnh sửa',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
