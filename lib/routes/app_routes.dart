import 'package:mobile_smart_dashboard/main.dart';
import 'package:mobile_smart_dashboard/pages/username_and_password/username_and_password_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.usernameandpassword;

  static final routes = [
    GetPage(
        name: Routes.usernameandpassword,
        page: () => const UsernameAndPasswordPage()),
  ];
}
