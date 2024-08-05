import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/core/usecase/usecase.dart';
import 'package:shopping_app/domain/entities/user.dart';
import 'package:shopping_app/domain/repositories/user_repository.dart';

class GetUserUsecase implements UseCase<Result<User>, Null> {
  final UserRepository _repository;

  GetUserUsecase(this._repository);

  @override
  Future<Result<User>> call(Null params) {
    return _repository.getUser();
  }
}
