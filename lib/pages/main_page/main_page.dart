import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_smart_dashboard/pages/bantuan/bantuan_page.dart';
import 'package:mobile_smart_dashboard/pages/home_page/home_page.dart';
import 'package:mobile_smart_dashboard/pages/riwayat/riwayat_page.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget bottomNavbar() {
      return BottomNavigationBar(
        backgroundColor: AppColorPrimay.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? SizedBox(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/vector/home_on_ic.svg',
                          ),
                          Text(
                            'Home',
                            style: AppText.textSmall.copyWith(
                                fontWeight: AppText.medium,
                                color: AppColorText.blue),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/vector/home_off_ic.svg',
                          ),
                          Text(
                            'Home',
                            style: AppText.textSmall.copyWith(
                                fontWeight: AppText.medium,
                                color: AppColorText.secondary),
                          )
                        ],
                      ),
                    ),
              label: ''),
          BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? SizedBox(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/vector/riwayat_ic.svg',
                            color: AppColorText.blue,
                          ),
                          Text(
                            'Riwayat',
                            style: AppText.textSmall.copyWith(
                                fontWeight: AppText.medium,
                                color: AppColorText.blue),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/vector/riwayat_ic.svg',
                          ),
                          Text(
                            'Riwayat',
                            style: AppText.textSmall.copyWith(
                                fontWeight: AppText.medium,
                                color: AppColorText.secondary),
                          )
                        ],
                      ),
                    ),
              label: ''),
          BottomNavigationBarItem(
              icon: currentIndex == 2
                  ? SizedBox(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/vector/bantuan_on_ic.svg',
                            color: AppColorText.blue,
                          ),
                          Text(
                            'Bantuan',
                            style: AppText.textSmall.copyWith(
                                fontWeight: AppText.medium,
                                color: AppColorText.blue),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/vector/bantuan_off_ic.svg',
                          ),
                          Text(
                            'Bantuan',
                            style: AppText.textSmall.copyWith(
                                fontWeight: AppText.medium,
                                color: AppColorText.secondary),
                          )
                        ],
                      ),
                    ),
              label: '')
        ],
      );
    }

    body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const RiwayatPage();
        case 2:
          return const BantuanPage();
        default:
          return body();
      }
    }

    return Scaffold(
      backgroundColor: AppColorPrimay.white,
      bottomNavigationBar: bottomNavbar(),
      body: body(),
    );
  }
}
