import 'package:d_chart/d_chart.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/controllers/userC.dart';
import 'package:mobile_smart_dashboard/models/user_model.dart';
import 'package:mobile_smart_dashboard/providers/auth_provider.dart';
import 'package:mobile_smart_dashboard/providers/device_provider.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getInit();
  //   super.initState();
  // }

  // getInit() async {
  //   await Provider.of<DeviceProvider>(context, listen: false).getDevices();
  // }

  final c = Get.find<UserC>();

  final List<String> items = [
    'Hari ini',
    '1 Minggu',
    '1 Bulan',
  ];
  String? selectedValue;

  final data = [
    {
      'penggunaan': 'Pagi',
      'student': 40,
    },
    {
      'penggunaan': 'Malam',
      'student': 60,
    },
  ];

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 20,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.account);
              },
              child: Image.asset(
                'assets/bitmap/profile_icon.png',
                height: 45,
                width: 45,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Pagi, ',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorGreyscale.normalHover),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${user.name}",
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorBlack.normal),
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColorPrimay.white,
              ),
              child: Image.asset(
                'assets/bitmap/notification_on_icon.png',
                scale: 3,
              ),
            )
          ],
        ),
      );
    }

    Widget billingDate() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 22,
        ),
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColorPrimay.white),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/bitmap/billing_date_image.png',
                scale: 3.5,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                'assets/bitmap/semi_circle_image.png',
                scale: 3,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next Billing Date',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.semiBold,
                      color: AppColorBlack.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text('Tenggat waktu : 16 September 2022',
                      style: AppText.textSmall.copyWith(
                          fontWeight: AppText.medium,
                          color: AppColorGreyscale.normalHover)),
                  const SizedBox(
                    height: 19,
                  ),
                  Text('Rp 150.000,-',
                      style: AppText.textExtraLarge.copyWith(
                          fontWeight: AppText.bold,
                          color: AppColorInfo.normalActive)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Belum termasuk pajak sebesar 11%',
                      style: AppText.textExtraSmall.copyWith(
                          fontWeight: AppText.medium,
                          color: AppColorInfo.dark)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 32,
                width: 116,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColorPrimay.normal),
                margin: const EdgeInsets.only(
                  right: 15,
                  bottom: 10,
                ),
                child: Center(
                  child: Text(
                    'Bayar Sekarang',
                    style: AppText.textExtraSmall.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorPrimay.white),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget distribusiKonsumsi() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 23,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Distribusi Konsumsi',
                  style: AppText.textBase.copyWith(
                      fontWeight: AppText.semiBold,
                      color: AppColorText.primary),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      'Hari ini',
                      style: AppText.textSmall.copyWith(
                          fontWeight: AppText.medium,
                          color: AppColorInfo.normalActive),
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: AppText.textSmall.copyWith(
                                    fontWeight: AppText.medium,
                                    color: AppColorInfo.normalActive),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    iconSize: 25,
                    iconEnabledColor: AppColorInfo.normal,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 30,
                    buttonWidth: 126,
                    buttonPadding: const EdgeInsets.only(left: 12, right: 8),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColorInfo.normalActive,
                      ),
                      color: AppColorPrimay.white,
                    ),
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 300,
                    dropdownWidth: 126,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColorPrimay.white,
                    ),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                height: 367,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColorPrimay.white),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.penggunaanair);
                        },
                        child: Text(
                          'See Detail',
                          style: AppText.textSmall.copyWith(
                              fontWeight: AppText.medium,
                              color: AppColorPrimay.normal),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 20 / 12,
                      child: SizedBox(
                        child: Stack(children: [
                          DChartPie(
                            data: data.map((e) {
                              return {
                                'domain': e['penggunaan'],
                                'measure': e['student']
                              };
                            }).toList(),
                            fillColor: (pieData, index) {
                              switch (pieData['domain']) {
                                case 'Pagi':
                                  return AppColorInfo.normalHover;
                                case 'Malam':
                                  return AppColorPrimay.lightActive;
                                default:
                                  return AppColorPrimay.white;
                              }
                            },
                            donutWidth: 20,
                            showLabelLine: false,
                            labelColor: AppColorPrimay.white,
                          ),
                          Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '280',
                                style: AppText.textTitle3.copyWith(
                                    fontWeight: AppText.semiBold,
                                    color: AppColorPrimay.normal),
                              ),
                              Text(
                                'm3',
                                style: AppText.textLarge.copyWith(
                                    fontWeight: AppText.medium,
                                    color: AppColorGreyscale.normalHover),
                              ),
                            ],
                          ))
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Penggunaan Pagi',
                                  style: AppText.textExtraSmall
                                      .copyWith(fontWeight: AppText.semiBold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: AppColorInfo.normalHover,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '130 m3',
                              style: AppText.textBase.copyWith(
                                  fontWeight: AppText.medium,
                                  color: AppColorText.primary),
                            ),
                            Text(
                              'Penggunaan Pagi\ndihitung mulai dari :\n00.00 - 12.00',
                              style: AppText.textExtraSmall.copyWith(
                                  fontWeight: AppText.regular,
                                  color: AppColorText.secondary),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Penggunaan Malam',
                                  style: AppText.textExtraSmall
                                      .copyWith(fontWeight: AppText.semiBold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  color: AppColorPrimay.lightActive,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '130 m3',
                              style: AppText.textBase.copyWith(
                                  fontWeight: AppText.medium,
                                  color: AppColorText.primary),
                            ),
                            Text(
                              'Penggunaan Malam\ndihitung mulai dari :\n12.01 - 23.59',
                              style: AppText.textExtraSmall.copyWith(
                                  fontWeight: AppText.regular,
                                  color: AppColorText.secondary),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: defaultMargin,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColorPrimay.background,
      body: SingleChildScrollView(
        child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                header(),
                billingDate(),
                distribusiKonsumsi(),
              ],
            )),
      ),
    );
  }
}
