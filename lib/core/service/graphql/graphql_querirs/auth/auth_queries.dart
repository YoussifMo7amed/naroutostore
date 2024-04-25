import 'package:naroutoshop/features/auth/data/model/login_request.dart';

class AuthQueries {
  factory AuthQueries() => _instance;
  const AuthQueries._();
  static const AuthQueries _instance = AuthQueries._();

  Map<String, dynamic> loginMapQuery({required LoginRequestBody body}) {
    return {
      'query': r'''
     mutation login($email: String!, $password: String!) {
	   login(email: $email, password: $password) {
		 access_token
		 refresh_token
	}
}''',
      'variables': {
        'email': body.email,
        'password': body.password,
      }
    };
  }
}
