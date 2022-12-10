import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/models/pembayaran_model.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:mobile_smart_dashboard/widgets/pembayaran_card.dart';
import 'package:mobile_smart_dashboard/widgets/transfer_pembayaran_card.dart';
import 'package:get/get.dart';

class PembayaranPage extends StatelessWidget {
  const PembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: AppColorPrimay.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColorText.primary,
            size: 18,
          ),
        ),
        title: Text(
          'Pembayaran',
          style: AppText.textLarge.copyWith(
              fontWeight: AppText.medium, color: AppColorText.primary),
        ),
      );
    }

    Widget checkoutPembayaran() {
      return Container(
        margin: EdgeInsets.only(
            left: defaultMargin, top: defaultMargin, right: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Checkout Pembayaran',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.bold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Segera selesaikan pembayaran dan\ngunakan kembali air mu sesuai\ndengan kebutuhan',
              style: AppText.textBase.copyWith(
                  fontWeight: AppText.medium, color: AppColorText.secondary),
            ),
          ],
        ),
      );
    }

    Widget metodePembayaran() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Metode Pembayaran',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.bold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: 155,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColorText.blue, width: 2),
                      color: AppColorPrimay.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/bitmap/transfer_manual_image.png',
                        width: 45,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Transfer\nManual',
                        style: AppText.textBase.copyWith(
                            fontWeight: AppText.semiBold,
                            color: AppColorText.primary),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 155,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColorPrimay.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/bitmap/transfer_otomatis_image.png',
                        width: 45,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Transfer\nOtomatis',
                        style: AppText.textBase.copyWith(
                            fontWeight: AppText.semiBold,
                            color: AppColorText.primary),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget pembayaranCard() {
      return Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, top: defaultMargin),
        child: PembayaranCard(Pembayaran(1, 'Januari', '393', 'ID12132132312',
            '150.000,-', '18.000,-', '168.000')),
      );
    }

    Widget transferPembayaran() {
      return Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, top: defaultMargin),
        child: const TransferPembayaranCard(),
      );
    }

    Widget buttonConfirm() {
      return Container(
        height: 51,
        width: double.infinity,
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColorPrimay.normal),
        child: Center(
          child: Text(
            'Konfirmasi Pembayaran',
            style: AppText.textBase.copyWith(
                fontWeight: AppText.medium, color: AppColorPrimay.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColorPrimay.background,
      floatingActionButton: buttonConfirm(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                checkoutPembayaran(),
                metodePembayaran(),
                pembayaranCard(),
                transferPembayaran(),
                const SizedBox(
                  height: 100,
                )
              ],
            )),
      ),
    );
  }
}
