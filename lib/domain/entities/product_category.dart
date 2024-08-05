import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';
part 'product_category.g.dart';

@freezed
class ProductCategory with _$ProductCategory {
  factory ProductCategory({
    required int id,
    required String name,
    required String image,
  }) = _ProductCategory;

  ProductCategory._();

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}
