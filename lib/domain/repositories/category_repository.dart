import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/product_category.dart';

abstract class CategoryRepository {
  Future<Result<List<ProductCategory>>> getCategories();
}
