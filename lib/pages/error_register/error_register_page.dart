import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';

class ErrorRegisterPage extends StatelessWidget {
  const ErrorRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/bitmap/error_register_image.png',
              height: 312,
              width: double.infinity - 2 * defaultMargin,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Oops! Sepertinya terjadi kesalahan pada sistem',
              textAlign: TextAlign.center,
              style: AppText.textExtraLarge.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Silahkan restart halaman ini untuk mengakses halaman yang diinginkan',
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
        onTap: () {},
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
              'Reload',
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
