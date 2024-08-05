import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/user.dart';

abstract class UserRepository {
  Future<Result<User>> getUser();
}
