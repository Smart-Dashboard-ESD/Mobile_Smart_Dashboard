import 'package:flutter/cupertino.dart';
import 'package:mobile_smart_dashboard/models/user_model.dart';
import 'package:mobile_smart_dashboard/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? nik,
    String? name,
    String? birthplace,
    String? birthdate,
    String? gender,
    String? province,
    String? city,
    String? kelurahan,
    String? rt,
    String? rw,
    String? address,
    String? username,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        nik: nik,
        name: name,
        birthplace: birthplace,
        birthdate: birthdate,
        gender: gender,
        province: province,
        city: city,
        kelurahan: kelurahan,
        rt: rt,
        rw: rw,
        address: address,
        username: username,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? username,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        username: username,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
