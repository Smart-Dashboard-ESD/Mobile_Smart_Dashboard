import 'package:mobile_smart_dashboard/pages/account/account_page.dart';
import 'package:mobile_smart_dashboard/pages/alamat/alamat_page.dart';
import 'package:mobile_smart_dashboard/pages/data_diri/data_diri_page.dart';
import 'package:mobile_smart_dashboard/pages/home_page/penggunaan_air.dart';
import 'package:mobile_smart_dashboard/pages/main_page/main_page.dart';
import 'package:mobile_smart_dashboard/pages/nomor_penduduk/nomor_penduduk_page.dart';
import 'package:mobile_smart_dashboard/pages/username_and_password/username_and_password_page.dart';
import 'package:mobile_smart_dashboard/pages/success_register/success_register_page.dart';
import 'package:mobile_smart_dashboard/pages/error_register/error_register_page.dart';
import 'package:mobile_smart_dashboard/pages/register_device/register_device_page.dart';
import 'package:mobile_smart_dashboard/pages/sign_in/sign_in_page.dart';
import 'package:mobile_smart_dashboard/pages/home_page/home_page.dart';
import 'package:mobile_smart_dashboard/pages/riwayat/riwayat_page.dart';
import 'package:mobile_smart_dashboard/pages/bantuan/bantuan_page.dart';
import 'package:mobile_smart_dashboard/pages/form_pengaduan/form_pengaduan_page.dart';
import 'package:mobile_smart_dashboard/pages/pembayaran/pembayaran_page.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import "package:get/get.dart";

class AppPages {
  static const initial = Routes.signin;

  static final routes = [
    GetPage(
      name: Routes.nomorpenduduk,
      page: () => const NomorPendudukPage(),
    ),
    GetPage(name: Routes.datadiri, page: () => const DataDiriPage()),
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
    GetPage(name: Routes.homepage, page: () => const HomePage()),
    GetPage(name: Routes.riwayat, page: () => const RiwayatPage()),
    GetPage(name: Routes.bantuan, page: () => const BantuanPage()),
    GetPage(name: Routes.formpengaduan, page: () => const FormPengaduanPage()),
    GetPage(name: Routes.pembayaran, page: () => const PembayaranPage()),
    GetPage(name: Routes.main, page: () => const MainPage()),
    GetPage(name: Routes.account, page: () => const AccountPage()),
    GetPage(name: Routes.penggunaanair, page: () => const PenggunaanAir()),
  ];
}
