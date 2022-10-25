import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';

enum Transfer { bca, mandiri }

class TransferPembayaranCard extends StatefulWidget {
  const TransferPembayaranCard({super.key});

  @override
  State<TransferPembayaranCard> createState() => _TransferPembayaranCardState();
}

class _TransferPembayaranCardState extends State<TransferPembayaranCard> {
  Transfer? _value = Transfer.bca;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 227,
      padding: EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColorPrimay.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transfer Pembayaran',
            style: AppText.textBase.copyWith(
                fontWeight: AppText.medium, color: AppColorText.primary),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Row(
            children: [
              Radio<Transfer>(
                value: Transfer.bca,
                groupValue: _value,
                onChanged: (Transfer? value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/bitmap/bca_image.png',
                    width: 60,
                    height: 20,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'PT Multi Instrumentasi (Admin Pateh)',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '01219090192',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Radio<Transfer>(
                value: Transfer.mandiri,
                groupValue: _value,
                onChanged: (Transfer? value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/bitmap/mandiri_image.png',
                    width: 60,
                    height: 20,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'PT Multi Instrumentasi (Admin Pateh)',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '01219090192',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorText.primary),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
