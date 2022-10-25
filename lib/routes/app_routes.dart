import 'package:mobile_smart_dashboard/pages/error_register/error_register_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.errorregister;

  static final routes = [
    GetPage(name: Routes.errorregister, page: () => const ErrorRegisterPage()),
  ];
}
