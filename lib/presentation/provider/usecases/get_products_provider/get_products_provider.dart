import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/domain/usecases/product/get_products/get_products_usecase.dart';
import 'package:shopping_app/presentation/provider/repositories/product_repository_provider.dart';

part 'get_products_provider.g.dart';

@riverpod
GetProductsUsecase getProducts(GetProductsRef ref) {
  return GetProductsUsecase(ref.read(productRepositoryProvider));
}
