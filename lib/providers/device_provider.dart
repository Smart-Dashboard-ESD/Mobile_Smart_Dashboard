import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/models/device_model.dart';
import 'package:mobile_smart_dashboard/services/device_service.dart';
import 'package:http/http.dart' as http;

// class DeviceProvider with ChangeNotifier {
//   List<DeviceModel> _devices = [];

//   List<DeviceModel> get devices => _devices;
//   set devices(List<DeviceModel> devices) {
//     _devices = devices;
//     notifyListeners();
//   }

//   Future<void> getDevices() async {
//     try {
//       List<DeviceModel> devices = await DeviceService().getDevices();
//       _devices = devices;
//     } catch (e) {
//       print(e);
//     }
//   }
// }

class DeviceProvider extends ChangeNotifier {
  DeviceModel? device;

  Future getData(context) async {
    var response = await DefaultAssetBundle.of(context)
        .loadString('assets/json/data.json');
    var mJson = json.decode(response);
    this.device = DeviceModel.fromJson(mJson);
    this.notifyListeners(); // for callback to view
  }
}
