import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/dio/dio_provider.dart';
import 'package:shopping_app/core/hive/hive_provider.dart';
import 'package:shopping_app/data/repositories/user_repository_impl.dart';
import 'package:shopping_app/domain/repositories/user_repository.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(
    dio: ref.read(dioProvider),
    box: ref.read(hiveProvider),
  );
}
