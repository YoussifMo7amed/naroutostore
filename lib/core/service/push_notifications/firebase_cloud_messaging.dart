import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:naroutoshop/core/apps/envvariables.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() => _instance;
  FirebaseCloudMessaging._();

  static final FirebaseCloudMessaging _instance = FirebaseCloudMessaging._();

  String fcmUrl = EnvVariable.instance.baseUrl;
  static const String subscriptionKey = 'narouto-store';
  static const String serviceAccountJsonString = '''
{
  "type": "service_account",
  "project_id": "narouto-store",
  "private_key_id": "9bc9a8970eed48624e2c55ed6f82e9a6d4c37626",
  "private_key": "-----BEGIN PRIVATE KEY-----\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9sBeklGucFeWv\\nIZHlJO1jIz26yE4fMtH5IDzDPyZ9UQLdUFrSQJRiVMFwbIPfZ6ZsmwTaA+moFP5X\\nAiUgaZjZMjCxhJUxmwOlounEkHZHOd6eA1GS6pquMQ97sSjjsbR5igIZkPw6pXj+\\n7ucq/nQraX8F525ttCLAG5yiYMLpYoaTxp0CHHr0c34D980CTsGuRDOLKEM0+9YM\\nF7QJhv97WTZLYcjz4RC+zOW9Vq7J1KPVF4yaYmVqAUUne8l2RO+yKP+3z1cWMt64\\nkoGQTGpczaSovu9eW9kxQbRpxbxJjrPgtrIkqbvpHTNckOqwdSk0M23U1LtzCwqh\\n2q6gJcHRAgMBAAECggEAJHDVJfC+eJKrWJj4JH+S3EoLpJuxCGTUukmzaqXx4L7E\\nsFwsynoOF5LlQ5IRRoSsz+37AWAhjgEUeIYouECZFNbDzIKmP8yiJ3qz8qd3FYlc\\nR1pnXDRWSXMS4KYg7xc3TucQrrUwA5tA8qbWQaf3DNT8SlfS2t/xkhrr3TT+FOQb\\nxIgacOLktzx5s4YB9mC6UxmVcBqDc4nk+D0HTnB20XgSo1VUJL9JdBtIRMY6TMhk\\nDL7UEJ0RsKb0vxN3cY7H4eu7m2M0CcV266LgEHmnCTx0oM7DMknpmcsr5dN+P7rz\\nqY1wckW4Rlp6SwD2jzZwt6jUnc8712m6mldp+BLB3QKBgQD1JTWWIjauTss12KKp\\nEXq4MYz7CGmZDY7Ch+/kZqahL4jHmOEll7dGmMelo2ywoj3MNx3zFPP4wgjNeLiT\\neMSPSvyb3pRSWGUlSanFkf7SMCyc2SdAaULHyiZYvqMD2Li5O7lZkwGmZ5V2xLOo\\nh5N9mFuMSS11ITULaMpfIMmQrQKBgQDGFkHJ+MilBSiSBPrcfgIIHkEvj3BTKEnN\\nlSTYuxz58rdig7dr2ptLrZ90bXP6OE807GCPiKGPs3NmI7mT4NZXaWHdowlI+E/0\\nXfCs61pt9bWQkQ4O4NLRrKF06YZxbsXl0CPCrwEQ8dxkFpnY96jyfksIUCA+c+xP\\n9FUD4jnGNQKBgCUk0CvBX1ul4LB19J99YITMLTpUGfvwy/K5uiV3UEQX+beUeHjD\\ntidiOs3kJzHUQ1zP9R/Byv2kGMVZR05A/Ddh+0h6vyqC7kBqGukup9edKQVS+dmO\\nmWnAPXMw325Txhl67SifV56pD0KBp18fu79J+IUXCWY389uYsyEazK+5AoGAJBFX\\nZ0wqVInM6lGHz/ANtKa1ndBTVoDmd01pySDA1O4R4Bk1o6jJUA1MFGn9jRkFqxBD\\nQL9TE5RMNdPZbYip3n6suCuAfE3iWQ9lzEaKT61Gow0WbzUWjeEOAPioZy0RUZgF\\neuRcoFY5l+vZlXz6wTSnutrEFDsNUz2c4Tkm5eUCgYEAiDbVis2UIbNcyGGbTI55\\nJXvD/LbIlM9f2+LcqrPlw354YJRx9N5hkEq71aQd9HMCZZBvY0TdIN8IkIuZizFS\\nVXPvvCGRtvzDEURHKTsVhpg6oRvSsw+usi81szcJ4N4URr3B5XtksoJ7X7CAORah\\n3oCgIF1mh5ZQMnwaEnwyx/U=\\n-----END PRIVATE KEY-----\\n",
  "client_email": "firebase-adminsdk-4n8ls@narouto-store.iam.gserviceaccount.com",
  "client_id": "103532476494135034006",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-4n8ls@narouto-store.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  bool isPermissionNotified = false;
  ValueNotifier<bool> isSubscribed = ValueNotifier(true);
  Future<void> init() async {
    await _permissionsNotification();
  }

  Future<void> controllerForUserSubscription() async {
    if (isPermissionNotified == false) {
      await _permissionsNotification();
    } else {
      if (isSubscribed.value == false) {
        await _subscribeToTopic();
      } else {
        await unsubscribeFromTopic();
      }
    }
  }

  Future<void> _permissionsNotification() async {
    final settings = await messaging.requestPermission(
      badge: false,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      isPermissionNotified = true;

      await _subscribeToTopic();

      debugPrint('🔔====User Granted Permission🔔====');
    } else {
      isPermissionNotified = false;
      isSubscribed.value = false;
      debugPrint('🏹====User declined or has not accepted permission🏹====');
    }
  }

  Future<void> _subscribeToTopic() async {
    isSubscribed.value = true;
    await FirebaseMessaging.instance.subscribeToTopic(subscriptionKey);
    debugPrint('🔔====User Subscribedd🔔====');
  }

  Future<void> unsubscribeFromTopic() async {
    isSubscribed.value = false;
    await FirebaseMessaging.instance.unsubscribeFromTopic(subscriptionKey);
    debugPrint('🏹====User Unsubscribedd🏹====');
  }

  Future<String> getAccessToken() async {
    // Load the service account key JSON file
    final serviceAccount = ServiceAccountCredentials.fromJson(
        jsonDecode(serviceAccountJsonString));

    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    // Obtain an authenticated HTTP client
    final authClient = await clientViaServiceAccount(serviceAccount, scopes);

    // Get the access token
    final accessToken = (await authClient.credentials).accessToken;

    // Close the client
    authClient.close();

    return accessToken.data;
  }

  Future<void> sendTopicNotification({
    required String title,
    required String body,
    required int productId,
  }) async {
    final String accessToken = await getAccessToken();
    final message = {
      'message': {
        'topic': subscriptionKey,
        'notification': {
          'title': title,
          'body': body,
        },
        'data': {
          'productId': productId,
        },
      },
    };

    final dio = Dio();

    try {
      final response = await dio.post(
        fcmUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
        ),
        data: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully!');
      } else {
        print('Failed to send notification: ${response.data}');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}
