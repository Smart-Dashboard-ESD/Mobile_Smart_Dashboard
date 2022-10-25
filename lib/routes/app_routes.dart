import 'package:mobile_smart_dashboard/pages/pembayaran/pembayaran_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.pembayaran;

  static final routes = [
    GetPage(name: Routes.pembayaran, page: () => const PembayaranPage()),
  ];
}
