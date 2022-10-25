import 'package:mobile_smart_dashboard/main.dart';
import 'package:mobile_smart_dashboard/pages/success_register/success_register_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.successregister;

  static final routes = [
    GetPage(
        name: Routes.successregister, page: () => const SuccessRegisterPage()),
  ];
}
