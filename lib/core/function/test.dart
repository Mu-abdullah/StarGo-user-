import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SendNotification {
  final String serverToken =
      'AAAAilzmE9Y:APA91bFy1Sc8Rlg2gYpQTkI4O9YOS4rK2Mslro98U97buX51VGrMGl9_INpNRm6_hHjwSdH7XDzaQdsv5qoGsx2lYd2AhyG36ER3xBL5FbHXxTS-GR9rwGvEIKH5aoLZN0cQnGoL6JSF'; // Obtain the server token from Firebase Console

  final String postUrl = 'https://fcm.googleapis.com/fcm/send';

  void sendNotificationToTopic({
    required String topic,
    required String title,
    required String body,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverToken',
    };

    final data = <String, dynamic>{
      'notification': <String, dynamic>{
        'body': body,
        'title': title,
      },
      'priority': 'high',
      'to': '/topics/$topic',
    };

    final response = await http.post(Uri.parse(postUrl),
        headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Notification sent successfully');
      }
    } else {
      if (kDebugMode) {
        print('Error sending notification. StatusCode: ${response.statusCode}');
      }
    }
  }
}
