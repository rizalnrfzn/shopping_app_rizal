import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping_app/core/dio/dio_setup.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) => dioSetup();
