import 'package:mobile_smart_dashboard/main.dart';
import 'package:mobile_smart_dashboard/pages/data_diri/data_diri_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.datadiri;

  static final routes = [
    GetPage(name: Routes.datadiri, page: () => const DataDiriPage()),
  ];
}
