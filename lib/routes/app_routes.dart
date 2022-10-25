import 'package:mobile_smart_dashboard/pages/home_page/home_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.homepage;

  static final routes = [
    GetPage(name: Routes.homepage, page: () => const HomePage()),
  ];
}
