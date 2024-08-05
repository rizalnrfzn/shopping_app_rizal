import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/result/result.dart';
import 'package:shopping_app/domain/entities/user.dart';
import 'package:shopping_app/domain/usecases/authorization/login/login_param.dart';
import 'package:shopping_app/presentation/provider/product/category_data_provider.dart';
import 'package:shopping_app/presentation/provider/product/product_data_provider.dart';
import 'package:shopping_app/presentation/provider/usecases/get_user_provider/get_user_provider.dart';
import 'package:shopping_app/presentation/provider/usecases/login_provider/login_provider.dart';
import 'package:shopping_app/presentation/provider/usecases/logout_provider/logout_provider.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    final user = await checkUser();

    if (user != null) {
      _getCategories();
      _getProducts();
    }

    return user;
  }

  Future<User?> checkUser() async {
    final result = await ref.read(getUserProvider).call(null);

    switch (result) {
      case Success(value: final user):
        return user;

      case Failed(message: _):
        return null;
    }
  }

  Future<void> login(LoginParam param) async {
    state = const AsyncLoading();

    final result = await ref.read(loginProvider).call(param);

    switch (result) {
      case Success(value: _):
        getUser();
        _getCategories();
        _getProducts();

      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> getUser() async {
    state = const AsyncLoading();

    final result = await ref.read(getUserProvider).call(null);

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);

      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    final result = await ref.read(logoutProvider).call(null);

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);

      case Failed(message: final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  void _getCategories() {
    ref.read(categoryDataProvider.notifier).getCategories();
  }

  void _getProducts() {
    ref.read(productDataProvider.notifier).getProducts();
  }
}
