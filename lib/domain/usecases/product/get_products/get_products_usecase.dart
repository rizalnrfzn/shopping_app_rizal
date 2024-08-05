import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/core/usecase/usecase.dart';
import 'package:shopping_app/domain/entities/product.dart';
import 'package:shopping_app/domain/repositories/product_repository.dart';

class GetProductsUsecase implements UseCase<Result<List<Product>>, Null> {
  final ProductRepository _repository;

  GetProductsUsecase(this._repository);

  @override
  Future<Result<List<Product>>> call(Null params) {
    return _repository.getProducts();
  }
}
