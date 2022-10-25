import 'package:mobile_smart_dashboard/pages/sign_in/sign_in_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.signin;

  static final routes = [
    GetPage(name: Routes.signin, page: () => const SignInPage()),
  ];
}
