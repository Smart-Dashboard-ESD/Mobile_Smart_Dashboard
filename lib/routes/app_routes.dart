import 'package:mobile_smart_dashboard/main.dart';
import 'package:mobile_smart_dashboard/pages/alamat/alamat_page.dart';
import 'package:mobile_smart_dashboard/pages/data_diri/data_diri_page.dart';
import 'package:mobile_smart_dashboard/pages/nomor_penduduk/nomor_penduduk_page.dart';
import 'package:mobile_smart_dashboard/pages/username_and_password/username_and_password_page.dart';
import 'package:mobile_smart_dashboard/pages/success_register/success_register_page.dart';
import 'package:mobile_smart_dashboard/pages/error_register/error_register_page.dart';
import 'package:mobile_smart_dashboard/pages/register_device/register_device_page.dart';
import 'package:mobile_smart_dashboard/pages/sign_in/sign_in_page.dart';
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
    GetPage(
        name: Routes.successregister, page: () => const SuccessRegisterPage()),
    GetPage(name: Routes.errorregister, page: () => const ErrorRegisterPage()),
    GetPage(
        name: Routes.registerdevice, page: () => const RegisterDevicePage()),
    GetPage(name: Routes.signin, page: () => const SignInPage()),
  ];
}
