import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/dio/dio_provider.dart';
import 'package:shopping_app/core/hive/hive_provider.dart';
import 'package:shopping_app/data/repositories/authentication_repository_impl.dart';
import 'package:shopping_app/domain/repositories/authentication_repository.dart';

part 'authentication_repository_provider.g.dart';

@riverpod
AuthenticationRepository authenticationRepository(
  AuthenticationRepositoryRef ref,
) {
  return AuthenticationRepositoryImpl(
    dio: ref.read(dioProvider),
    box: ref.read(hiveProvider),
  );
}
