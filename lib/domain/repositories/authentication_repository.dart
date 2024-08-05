import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/token.dart';
import 'package:shopping_app/domain/usecases/authorization/login/login_param.dart';

abstract class AuthenticationRepository {
  Future<Result<Token>> login(LoginParam param);

  Future<Result<void>> logout();
}
