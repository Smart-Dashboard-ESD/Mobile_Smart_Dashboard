import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:mobile_smart_dashboard/widgets/pending_ticket.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: AppColorPrimay.background,
        centerTitle: true,
        title: Text(
          'Customer Care',
          style: AppText.textExtraLarge.copyWith(
              fontWeight: AppText.semiBold, color: AppColorText.primary),
        ),
        elevation: 0,
      );
    }

    Widget detailPetugas() {
      return Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Petugas',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.medium, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 278,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColorPrimay.white),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 15, bottom: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/bitmap/detail_petugas_image.png',
                          width: 60,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama :',
                              style: AppText.textSmall.copyWith(
                                  fontWeight: AppText.medium,
                                  color: AppColorText.secondary),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Ahmad Bahrullah Abdullah',
                              style: AppText.textBase.copyWith(
                                  fontWeight: AppText.medium,
                                  color: AppColorText.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: AppColorPrimay.background,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColorInfo.normal),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/vector/map_ic.svg',
                                width: 35,
                                height: 35,
                              ),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address :',
                              style: AppText.textSmall.copyWith(
                                  fontWeight: AppText.medium,
                                  color: AppColorText.secondary),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Jln H. Agus Salim, Bandung',
                              style: AppText.textBase.copyWith(
                                  fontWeight: AppText.medium,
                                  color: AppColorText.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: AppColorPrimay.background,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColorInfo.normal),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/vector/job_ic.svg',
                                width: 35,
                                height: 35,
                              ),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job :',
                              style: AppText.textSmall.copyWith(
                                  fontWeight: AppText.medium,
                                  color: AppColorText.secondary),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Officer III IoT Platform\nDevelopment',
                              style: AppText.textBase.copyWith(
                                  fontWeight: AppText.medium,
                                  color: AppColorText.primary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget keluhanCard() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 25),
        padding: const EdgeInsets.only(left: 15, top: 12, right: 12),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColorPrimay.normal),
        child: Stack(
          children: [
            Image.asset(
              'assets/bitmap/keluhan_image.png',
              width: 118,
              height: 118,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Punya Keluhan ?',
                      style: AppText.textLarge.copyWith(
                          fontWeight: AppText.semiBold,
                          color: AppColorPrimay.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Sampaikan keluhanmu\nkepada kami',
                      style: AppText.textSmall.copyWith(
                          fontWeight: AppText.medium,
                          color: AppColorGreyscale.lightActive),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 32,
                    width: 96,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColorPrimay.white),
                    child: Center(
                      child: Text(
                        'Lapor Sekarang',
                        style: AppText.textExtraSmall.copyWith(
                            fontWeight: AppText.semiBold,
                            color: AppColorText.blue),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget tabController() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(children: [
          DefaultTabController(
              length: 2,
              child: Column(children: [
                SizedBox(
                  child: TabBar(
                    labelColor: AppColorText.blue,
                    unselectedLabelColor: AppColorText.secondary,
                    indicatorColor: AppColorText.blue,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        child: Text(
                          'Pending Tickets',
                          style: AppText.textLarge.copyWith(
                            fontWeight: AppText.semiBold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Resolved Tickets',
                          style: AppText.textLarge.copyWith(
                            fontWeight: AppText.semiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: defaultMargin,
                        right: defaultMargin,
                        top: defaultMargin),
                    height: 400,
                    child: TabBarView(children: [
                      Column(
                        children: const [
                          PendingTiket(),
                          SizedBox(
                            height: 8,
                          ),
                          PendingTiket(),
                        ],
                      ),
                      const SizedBox(
                        child: Center(
                          child: Text('Display Tab 2',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ]))
              ])),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: AppColorPrimay.background,
      body: SingleChildScrollView(
        child: SafeArea(
            bottom: true,
            child: Column(
              children: [
                header(),
                detailPetugas(),
                keluhanCard(),
                tabController(),
              ],
            )),
      ),
    );
  }
}
