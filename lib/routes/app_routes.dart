import 'package:mobile_smart_dashboard/main.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.main;

  static final routes = [
    GetPage(name: Routes.main, page: () => const MobileSmartDashboard()),
  ];
}
