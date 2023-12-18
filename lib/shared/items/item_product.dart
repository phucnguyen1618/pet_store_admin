import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store_admin/models/product.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  final Function(Product) onEdit;
  final Function(Product) onDelete;

  const ItemProduct({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                width: 100.0,
                height: 100.0,
                imageUrl: product.image,
                imageBuilder: (context, provider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.redAccent,
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
                      product.name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${AppUtils.formatPrice(product.getPrice())}đ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                        product.categories.length > 1
                            ? product.categories
                                .map((e) => e)
                                .toString()
                                .replaceAll('(', '')
                                .replaceAll(')', '')
                            : product.categories.first.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black38,
                          fontSize: 12.0,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MaterialButton(
                onPressed: () {
                  onEdit(product);
                },
                elevation: 0.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: const BorderSide(
                      width: 0.5,
                      color: Colors.blue,
                    )),
                child: const Text(
                  'Chỉnh sửa',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const SizedBox(width: 4.0),
              MaterialButton(
                onPressed: () {
                  onDelete(product);
                },
                color: Colors.red,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                child: const Text(
                  'Xoá sản phẩm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
