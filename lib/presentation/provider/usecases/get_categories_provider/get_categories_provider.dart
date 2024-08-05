import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/domain/usecases/product/get_categories/get_categories_usecase.dart';
import 'package:shopping_app/presentation/provider/repositories/category_repository_provider.dart';

part 'get_categories_provider.g.dart';

@riverpod
GetCategoriesUsecase getCategories(GetCategoriesRef ref) {
  return GetCategoriesUsecase(ref.read(categoryRepositoryProvider));
}
