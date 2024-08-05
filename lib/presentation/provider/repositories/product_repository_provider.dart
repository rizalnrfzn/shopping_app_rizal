import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/dio/dio_provider.dart';
import 'package:shopping_app/data/repositories/product_repository_impl.dart';
import 'package:shopping_app/domain/repositories/product_repository.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(ref.read(dioProvider));
}
