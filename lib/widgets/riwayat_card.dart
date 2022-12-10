import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/models/riwayat_model.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';

class RiwayatCard extends StatelessWidget {
  final RiwayatTransaksi riwayatTransaksi;
  const RiwayatCard(this.riwayatTransaksi, {super.key});

  @override
  Widget build(BuildContext context) {
    isSuccess() {
      switch (riwayatTransaksi.isSuccess) {
        case '0':
          return Container(
            height: 32,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColorDanger.normal,
            ),
            child: Center(
              child: Text(
                'Failed',
                style: AppText.textExtraSmall.copyWith(
                    fontWeight: AppText.medium, color: AppColorPrimay.white),
              ),
            ),
          );
        case '1':
          return Container(
            height: 32,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColorSuccess.normal,
            ),
            child: Center(
              child: Text(
                'Success',
                style: AppText.textExtraSmall.copyWith(
                    fontWeight: AppText.medium, color: AppColorPrimay.white),
              ),
            ),
          );
        default:
          return Container(
            height: 32,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColorGreyscale.normal.withOpacity(0.5),
            ),
            child: Center(
              child: Text(
                'In Process',
                style: AppText.textExtraSmall.copyWith(
                    fontWeight: AppText.medium, color: AppColorPrimay.white),
              ),
            ),
          );
      }
    }

    return Container(
      height: 220,
      width: double.infinity,
      color: AppColorPrimay.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    riwayatTransaksi.bulan,
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.semiBold,
                      color: AppColorText.primary,
                    ),
                  ),
                  Text(
                    '${riwayatTransaksi.penggunaan} m3',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  )
                ],
              ),
              isSuccess(),
            ],
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID Pembayaran ',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.secondary),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Tagihan ',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.secondary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Pajak ',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.secondary),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    riwayatTransaksi.idPembayaran,
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    riwayatTransaksi.tagihan,
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    riwayatTransaksi.pajak,
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 29,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '16/01/2022',
                  style: AppText.textBase.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.secondary),
                ),
                Text(
                  '09:46 AM',
                  style: AppText.textExtraSmall.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.secondary),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
