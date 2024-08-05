import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  @HiveType(typeId: 0)
  factory Token({
    @HiveField(0) @JsonKey(name: 'access_token') required String accessToken,
    @HiveField(1) @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _Token;

  Token._();

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
