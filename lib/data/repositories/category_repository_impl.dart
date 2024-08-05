import 'package:dio/dio.dart';
import 'package:shopping_app/core/api/api_list.dart';
import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/product_category.dart';
import 'package:shopping_app/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final Dio _dio;

  CategoryRepositoryImpl(this._dio);

  @override
  Future<Result<List<ProductCategory>>> getCategories() async {
    try {
      final response = await _dio.get(ApiList.categories);

      final result = List<Map<String, dynamic>>.from(response.data);

      return Result.success(
        result.map((e) => ProductCategory.fromJson(e)).toList(),
      );
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
