import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_app/core/api/api_list.dart';
import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/user.dart';
import 'package:shopping_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio _dio;
  final Box _box;

  UserRepositoryImpl({
    required Dio dio,
    required Box box,
  })  : _dio = dio,
        _box = box;

  @override
  Future<Result<User>> getUser() async {
    try {
      final token = _box.get('token');
      final response = await _dio.get(ApiList.getUser,
          options: Options(headers: {
            'Authorization': 'Bearer ${token.accessToken}',
          }));

      final result = Map<String, dynamic>.from(response.data);

      final user = User.fromJson(result);

      _box.put('user', user);

      return Result.success(user);
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    } catch (e) {
      return Result.failed(e.toString());
    }
  }
}
