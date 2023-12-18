import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/service_management/controller/service_management_controller.dart';
import 'package:pet_store_admin/routes/app_routes.dart';
import 'package:pet_store_admin/shared/items/item_service.dart';
import 'package:pet_store_admin/shared/utils/bottomsheet_utils.dart';
import 'package:pet_store_admin/shared/widgets/empty_data.dart';

class ServiceManagementPage extends GetView<ServiceManagementController> {
  const ServiceManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Quản lý dịch vụ',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => controller.services.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ItemService(
                          service: controller.services[index],
                          onEdit: (service) {
                            BottomSheetUtils.showBottomSheetEditService(
                                service, context, (data) {
                              controller.onEditServiceItem(
                                  service.idService, data);
                            });
                          },
                          onDelete: (id) {
                            controller.onDeleteServiceItem(id);
                          },
                        ),
                    separatorBuilder: (context, index) =>
                        const Divider(thickness: 0.5),
                    itemCount: controller.services.length)
                : EmptyData(
                    type: EmptyDataType.serviceListEmpty,
                    onClick: () {},
                  )),
          )
        ],
      ),
      persistentFooterButtons: [
        ButtonTheme(
          height: 42.0,
          child: MaterialButton(
            onPressed: () {
              Get.toNamed(AppRoutes.addServicePage);
            },
            color: Colors.blue,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Text(
              'Thêm dịch vụ',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
