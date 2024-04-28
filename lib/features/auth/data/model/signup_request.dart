import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
    this.role,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? avatar;
  final String? role;

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
