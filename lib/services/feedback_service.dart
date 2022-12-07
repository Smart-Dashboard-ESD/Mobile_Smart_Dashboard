import 'dart:convert';

import 'package:mobile_smart_dashboard/models/feedback_model.dart';
import 'package:http/http.dart' as http;

class FeedbackService {
  String baseUrl = 'https://xivwmhd5m2.us-east-1.awsapprunner.com/users';

  Future<FeedbackModel> feedback({
    String? name,
    String? kodeAlat,
    String? address,
    String? noHp,
    String? feedback,
  }) async {
    var url = Uri.parse('$baseUrl/feedback');
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'name': name,
      'kodeAlat': kodeAlat,
      'address': address,
      'noHp': noHp,
      'feedback': feedback,
    });

    var response = await http.post(url, headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      FeedbackModel feedback = FeedbackModel.fromJson(data);

      return feedback;
    } else {
      throw Exception('Gagal Feedback');
    }
  }
}
