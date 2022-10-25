import 'package:mobile_smart_dashboard/pages/bantuan/bantuan_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.bantuan;

  static final routes = [
    GetPage(name: Routes.bantuan, page: () => const BantuanPage()),
  ];
}
