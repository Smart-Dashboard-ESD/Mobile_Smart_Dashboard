import 'package:mobile_smart_dashboard/pages/form_pengaduan/form_pengaduan_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.formpengaduan;

  static final routes = [
    GetPage(name: Routes.formpengaduan, page: () => const FormPengaduanPage()),
  ];
}
