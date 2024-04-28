import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  SignUpRequestBody(this.name, this.email, this.password, this.avatar, this.role);

  final String? name;
  final String? email;
  final String? password;
  final String? avatar;
  final String? role;

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
