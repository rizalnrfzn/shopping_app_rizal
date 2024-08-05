import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/core/usecase/usecase.dart';
import 'package:shopping_app/domain/entities/product_category.dart';
import 'package:shopping_app/domain/repositories/category_repository.dart';

class GetCategoriesUsecase
    implements UseCase<Result<List<ProductCategory>>, Null> {
  final CategoryRepository _repository;

  GetCategoriesUsecase(this._repository);

  @override
  Future<Result<List<ProductCategory>>> call(Null params) {
    return _repository.getCategories();
  }
}
