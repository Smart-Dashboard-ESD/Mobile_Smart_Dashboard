import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';

class SuccessRegisterPage extends StatelessWidget {
  const SuccessRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/bitmap/success_register_image.png',
              height: 312,
              width: double.infinity - 2 * defaultMargin,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Selamat berhasil terdaftar di Automated Water Meter',
              textAlign: TextAlign.center,
              style: AppText.textExtraLarge.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Kamu sudah terdaftar. Silahkan menikmati layanan yang telah kami sediakan',
              textAlign: TextAlign.center,
              style: AppText.textBase.copyWith(
                  fontWeight: AppText.medium, color: AppColorText.secondary),
            ),
          ],
        ),
      );
    }

    Widget buttonGoHome() {
      return GestureDetector(
        onTap: () {
          Get.offAllNamed(Routes.main);
        },
        child: Container(
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, top: 30),
          height: 51,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColorPrimay.normal),
          child: Center(
            child: Text(
              'Go to Home',
              style: AppText.textBase.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorPrimay.white),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColorPrimay.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          content(),
          buttonGoHome(),
        ],
      ),
    );
  }
}
