import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:shopping_app/core/api/api_list.dart';
import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/token.dart';
import 'package:shopping_app/domain/repositories/authentication_repository.dart';
import 'package:shopping_app/domain/usecases/authorization/login/login_param.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final Dio _dio;
  final Box _box;

  AuthenticationRepositoryImpl({
    required Dio dio,
    required Box box,
  })  : _dio = dio,
        _box = box;

  @override
  Future<Result<Token>> login(LoginParam param) async {
    try {
      final response = await _dio.post(
        ApiList.login,
        data: param.toJson(),
      );

      final result = Map<String, dynamic>.from(response.data);

      final token = Token.fromJson(result);

      await _box.put('token', token);

      return Result.success(token);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Result.failed('Email atau password salah');
      } else {
        return Result.failed('${e.message}');
      }
    } catch (e) {
      return Result.failed(e.toString());
    }
  }

  @override
  Future<Result<void>> logout() async {
    await _box.delete('token');
    if (_box.get('token') == null) {
      return const Result.success(null);
    } else {
      return const Result.failed('Terjadi kesalah saat logout');
    }
  }
}
