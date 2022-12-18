import 'dart:convert';

import 'package:mobile_smart_dashboard/models/device_model.dart';
import 'package:http/http.dart' as http;

class DeviceService {
  String baseUrl = 'https://xivwmhd5m2.us-east-1.awsapprunner.com/users/device';

  Future<DeviceModel> getDevices() async {
    var url = Uri.parse(
        '$baseUrl/getAllWater?custid=05d74257-573a-4a30-b54b-1a638c1e8862&devid=6c812cc1-ed91-44a1-a608-323c07e35994');

    final response = await http.get(url);
    print(response.body);

    if (response.statusCode == 201) {
      return DeviceModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal Get Data!");
    }
  }
}
