import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/models/riwayat_model.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:mobile_smart_dashboard/widgets/riwayat_card.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Riwayat Transaksi',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            Text(
              'Lihat Semua',
              style: AppText.textSmall.copyWith(
                  fontWeight: AppText.medium, color: AppColorPrimay.normal),
            ),
          ],
        ),
      );
    }

    Widget riwayatCard() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 30),
        child: Column(
          children: [
            RiwayatCard(RiwayatTransaksi(1, 'Januari', 399, ': ID12132132312',
                ': Rp 150.000', ': Rp 18.000', 'default')),
            const SizedBox(
              height: 15,
            ),
            RiwayatCard(RiwayatTransaksi(2, 'Februari', 400, ': ID12132132313',
                ': Rp 155.000', ': Rp 20.000', '1')),
            const SizedBox(
              height: 15,
            ),
            RiwayatCard(RiwayatTransaksi(3, 'Maret', 380, ': ID12132132314',
                ': Rp 120.000', ': Rp 16.000', '0')),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColorPrimay.background,
      body: SingleChildScrollView(
        child: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              children: [
                header(),
                riwayatCard(),
              ],
            )),
      ),
    );
  }
}
