import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();
  static final instance = EnvVariable._();

  String _envType = '';
  String _baseUrl = '';

  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');

      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
    }

    _envType = dotenv.get('ENV_TYPE');
    _baseUrl = dotenv.get('BASE_URL');
  }

  bool get debugShowMode => _envType == 'dev';
  String get baseUrl => _baseUrl;

}
