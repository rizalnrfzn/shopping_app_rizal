import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: 1)
  factory User({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) required String password,
    @HiveField(4) required String role,
    @HiveField(5) required String avatar,
  }) = _User;

  User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
