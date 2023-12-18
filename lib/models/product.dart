import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  String idProduct;
  String name;
  String image;
  double cost;
  double? discount;
  String? desc;
  List<String> categories;

  Product(
    this.idProduct,
    this.name,
    this.image,
    this.cost,
    this.discount,
    this.desc,
    this.categories,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  double getPrice() {
    return discount != null
        ? discount != 0
            ? cost - cost * (discount! / 100)
            : cost
        : cost;
  }
}
