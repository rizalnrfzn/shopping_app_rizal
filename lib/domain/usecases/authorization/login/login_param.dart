import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_param.freezed.dart';
part 'login_param.g.dart';

@freezed
class LoginParam with _$LoginParam {
  factory LoginParam({
    required String email,
    required String password,
  }) = _LoginParam;

  LoginParam._();

  factory LoginParam.fromJson(Map<String, dynamic> json) =>
      _$LoginParamFromJson(json);
}
