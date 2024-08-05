import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/product.dart';
import 'package:shopping_app/presentation/provider/usecases/get_products_provider/get_products_provider.dart';

part 'product_data_provider.g.dart';

@Riverpod(keepAlive: true)
class ProductData extends _$ProductData {
  @override
  FutureOr<List<Product>> build() => [];

  Future<void> getProducts({int offset = 0, int limit = 10}) async {
    state = const AsyncLoading();

    final result = await ref.read(getProductsProvider).call(null);

    switch (result) {
      case Success(value: final products):
        state = AsyncData(products);

      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData([]);
    }
  }
}
