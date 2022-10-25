import 'package:mobile_smart_dashboard/main.dart';
import 'package:mobile_smart_dashboard/pages/alamat/alamat_page.dart';
import 'package:mobile_smart_dashboard/pages/data_diri/data_diri_page.dart';
import 'package:mobile_smart_dashboard/pages/nomor_penduduk/nomor_penduduk_page.dart';
import 'package:mobile_smart_dashboard/pages/username_and_password/username_and_password_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.usernameandpassword;

  static final routes = [
    GetPage(name: Routes.datadiri, page: () => const DataDiriPage()),
    GetPage(name: Routes.nomorpenduduk, page: () => const NomorPendudukPage()),
    GetPage(name: Routes.alamat, page: () => const AlamatPage()),
    GetPage(
        name: Routes.usernameandpassword,
        page: () => const UsernameAndPasswordPage()),
  ];
}
