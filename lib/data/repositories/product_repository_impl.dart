import 'package:dio/dio.dart';
import 'package:shopping_app/core/api/api_list.dart';
import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/product.dart';
import 'package:shopping_app/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final Dio _dio;

  ProductRepositoryImpl(this._dio);

  @override
  Future<Result<List<Product>>> getProducts() async {
    try {
      final response = await _dio.get(ApiList.products);

      final result = List<Map<String, dynamic>>.from(response.data);

      return Result.success(
        result.map((e) => Product.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
