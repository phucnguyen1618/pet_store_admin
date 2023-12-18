import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/product.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';
import 'package:pet_store_admin/shared/widgets/loading_data.dart';

import '../../models/order_detail.dart';

class ItemProductInOrder extends StatefulWidget {
  final OrderDetail orderDetail;

  const ItemProductInOrder({super.key, required this.orderDetail});

  @override
  State<ItemProductInOrder> createState() => _ItemProductInOrderState();
}

class _ItemProductInOrderState extends State<ItemProductInOrder> {
  Product? product;

  @override
  void initState() {
    onGetProductInfo();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemProductInOrder oldWidget) {
    if (oldWidget.orderDetail != widget.orderDetail) {
      onGetProductInfo();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return product != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  width: 100.0,
                  height: 100.0,
                  imageUrl: product!.image,
                  imageBuilder: (context, provider) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.white,
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product!.name,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppUtils.formatPrice(product!.getPrice()),
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "x${widget.orderDetail.quantity}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : const LoadingData();
  }

  Future<void> onGetProductInfo() async {
    FirebaseService.getProductByID(widget.orderDetail.idProduct, (productInfo) {
      setState(() {
        product = productInfo;
      });
    }, (error) {
      log('Error: $error');
    });
  }
}
