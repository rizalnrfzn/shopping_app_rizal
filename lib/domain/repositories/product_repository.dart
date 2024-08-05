import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> getProducts();
}
