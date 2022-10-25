import 'package:mobile_smart_dashboard/main.dart';
import 'package:mobile_smart_dashboard/pages/nomor_penduduk/nomor_penduduk_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.nomorpenduduk;

  static final routes = [
    GetPage(name: Routes.nomorpenduduk, page: () => const NomorPendudukPage()),
  ];
}
