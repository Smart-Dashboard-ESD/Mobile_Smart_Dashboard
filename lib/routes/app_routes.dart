import 'package:mobile_smart_dashboard/pages/riwayat/riwayat_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.riwayat;

  static final routes = [
    GetPage(name: Routes.riwayat, page: () => const RiwayatPage()),
  ];
}
