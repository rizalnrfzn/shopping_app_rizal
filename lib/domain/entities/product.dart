import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_app/domain/entities/product_category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required int id,
    required String title,
    required int price,
    required String description,
    required ProductCategory category,
    required List<String> images,
  }) = _Product;

  Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
