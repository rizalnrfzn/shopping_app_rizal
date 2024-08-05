import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/domain/usecases/authorization/login/login_usecase.dart';
import 'package:shopping_app/presentation/provider/repositories/authentication_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
LoginUsecase login(LoginRef ref) {
  return LoginUsecase(ref.read(authenticationRepositoryProvider));
}
