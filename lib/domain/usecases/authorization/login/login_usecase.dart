import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/core/usecase/usecase.dart';
import 'package:shopping_app/domain/entities/token.dart';
import 'package:shopping_app/domain/repositories/authentication_repository.dart';
import 'package:shopping_app/domain/usecases/authorization/login/login_param.dart';

class LoginUsecase implements UseCase<Result<Token>, LoginParam> {
  final AuthenticationRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Result<Token>> call(LoginParam params) {
    return repository.login(params);
  }
}
