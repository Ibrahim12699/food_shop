import 'package:food_shop/src/core/resources/enums.dart';

class ProductModel {
  ProductModel({
    this.index,
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.type,
  });

  int? index;
  String? id;
  String? name;
  String? description;
  double? price;
  String? image;
  ProductType? type;
}
