import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/dio/dio_provider.dart';
import 'package:shopping_app/data/repositories/category_repository_impl.dart';
import 'package:shopping_app/domain/repositories/category_repository.dart';

part 'category_repository_provider.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepositoryImpl(ref.read(dioProvider));
}
