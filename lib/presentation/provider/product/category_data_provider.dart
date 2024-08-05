import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/product_category.dart';
import 'package:shopping_app/presentation/provider/usecases/get_categories_provider/get_categories_provider.dart';

part 'category_data_provider.g.dart';

@Riverpod(keepAlive: true)
class CategoryData extends _$CategoryData {
  @override
  FutureOr<List<ProductCategory>> build() => [];

  Future<void> getCategories() async {
    state = const AsyncLoading();

    final result = await ref.read(getCategoriesProvider).call(null);

    switch (result) {
      case Success(value: final categories):
        state = AsyncData(categories);

      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData([]);
    }
  }
}
