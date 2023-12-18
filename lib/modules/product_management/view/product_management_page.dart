import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/models/product.dart';
import 'package:pet_store_admin/modules/product_management/controller/product_management_controller.dart';
import 'package:pet_store_admin/routes/app_routes.dart';
import 'package:pet_store_admin/shared/items/item_product.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';
import 'package:pet_store_admin/shared/utils/dialog_utils.dart';
import 'package:pet_store_admin/shared/widgets/empty_data.dart';

class ProductManagementPage extends StatefulWidget {
  const ProductManagementPage({super.key});

  @override
  State<ProductManagementPage> createState() => _ProductManagementPageState();
}

class _ProductManagementPageState extends State<ProductManagementPage> {
  List<Product> products = [];

  final controller = Get.find<ProductManagementController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Quản lý sản phẩm',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addProductPage);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: FirebaseService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              products.addAll(snapshot.data ?? []);
            }
          }
          return products.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ItemProduct(
                        product: products[index],
                        onEdit: (product) {
                          Get.toNamed(AppRoutes.addProductPage,
                              arguments: product);
                        },
                        onDelete: (product) {
                          DialogUtils.showDeleteProductDialog(product, (id) {
                            controller.onProductDelete(id);
                          });
                        },
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: products.length)
              : EmptyData(
                  type: EmptyDataType.productListEmpty,
                  onClick: () {},
                );
        },
      ),
    );
  }
}
