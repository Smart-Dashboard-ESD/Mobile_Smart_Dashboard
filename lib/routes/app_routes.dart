import 'package:mobile_smart_dashboard/pages/register_device/register_device_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.registerdevice;

  static final routes = [
    GetPage(
        name: Routes.registerdevice, page: () => const RegisterDevicePage()),
  ];
}
