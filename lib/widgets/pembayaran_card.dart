import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/models/pembayaran_model.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';

class PembayaranCard extends StatelessWidget {
  final Pembayaran pembayaranCard;
  const PembayaranCard(this.pembayaranCard, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 229,
      width: double.infinity,
      padding:
          EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColorPrimay.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pembayaranCard.month,
                    style: AppText.textLarge.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                  Text(
                    'Total Penggunaan : ${pembayaranCard.totalPenggunaan} m3',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '16/01/2022',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                  Text(
                    '09:46 AM',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID Pembayaran',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.secondary),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    'Tagihan',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.secondary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Pajak',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.secondary),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    'Total Tagihan',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.secondary),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ': Rp ${pembayaranCard.idPembayaran}',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    ': Rp ${pembayaranCard.tagihan}',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    ': Rp ${pembayaranCard.pajak}',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    ': Rp ${pembayaranCard.totalTagihan}',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
