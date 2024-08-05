import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/domain/usecases/authorization/logout/logout_usecase.dart';
import 'package:shopping_app/presentation/provider/repositories/authentication_repository_provider.dart';

part 'logout_provider.g.dart';

@riverpod
LogoutUsecase logout(LogoutRef ref) {
  return LogoutUsecase(ref.read(authenticationRepositoryProvider));
}
