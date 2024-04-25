import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request.g.dart';
@JsonSerializable()
class LoginRequestBody {
  LoginRequestBody({required this.email, required this.password});

  final String? email;
  final String? password;
  Map<String,dynamic> toJson()=>_$LoginRequestBodyToJson(this);
}