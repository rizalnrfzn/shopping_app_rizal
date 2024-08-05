import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/core/usecase/usecase.dart';
import 'package:shopping_app/domain/repositories/authentication_repository.dart';

class LogoutUsecase implements UseCase<Result<void>, Null> {
  final AuthenticationRepository _repository;

  LogoutUsecase(this._repository);

  @override
  Future<Result<void>> call(Null params) {
    return _repository.logout();
  }
}
