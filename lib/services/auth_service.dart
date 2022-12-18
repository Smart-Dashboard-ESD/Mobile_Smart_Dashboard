import 'dart:convert';

import 'package:mobile_smart_dashboard/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://xivwmhd5m2.us-east-1.awsapprunner.com/users';

  Future<UserModel> register({
    String? nik,
    String? name,
    String? birthplace,
    String? birthdate,
    String? gender,
    String? province,
    String? rt,
    String? rw,
    String? address,
    String? username,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'nik': nik,
      'name': name,
      'birthplace': birthplace,
      'birthdate': birthdate,
      'gender': gender,
      'province': province,
      'rt': rt,
      'rw': rw,
      'address': address,
      'username': username,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String? username,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'username': username,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + jsonDecode(response.body)['token'];
      user.name = data['data']['name'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
