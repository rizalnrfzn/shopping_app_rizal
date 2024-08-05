import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/domain/usecases/user/get_user/get_user_usecase.dart';
import 'package:shopping_app/presentation/provider/repositories/user_repository_provider.dart';

part 'get_user_provider.g.dart';

@riverpod
GetUserUsecase getUser(GetUserRef ref) {
  return GetUserUsecase(ref.read(userRepositoryProvider));
}
