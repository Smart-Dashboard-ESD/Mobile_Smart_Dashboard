import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';

class PendingTiket extends StatelessWidget {
  const PendingTiket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: defaultMargin),
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColorPrimay.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ticket 1235',
                style: AppText.textBase.copyWith(
                    fontWeight: AppText.bold, color: AppColorText.blue),
              ),
              Container(
                height: 32,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColorText.secondary.withOpacity(0.5)),
                child: Center(
                  child: Text(
                    'In Process',
                    style: AppText.textExtraSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorPrimay.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
              Text(
                '+(62) 9090128989',
                style: AppText.textSmall.copyWith(
                    fontWeight: AppText.medium, color: AppColorText.secondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
