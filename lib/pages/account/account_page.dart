import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
          'Profil Pengguna',
          style: AppText.textLarge.copyWith(
              fontWeight: AppText.medium, color: AppColorText.primary),
        ),
      );
    }

    Widget profile() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/bitmap/profile_icon.png',
              width: 75,
              height: 75,
            ),
            const SizedBox(
              width: 26,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rizal Bimantoro',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text('0895047898773',
                      style: AppText.textBase.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary,
                      )),
                  const SizedBox(
                    height: 2,
                  ),
                  Text('Bandung, Jawa Barat',
                      style: AppText.textBase.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary,
                      ))
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/vector/edit_ic.svg',
              width: 25,
            ),
          ],
        ),
      );
    }

    Widget divider() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 35),
        child: const Divider(
          color: AppColorGreyscale.lightActive,
          thickness: 1,
        ),
      );
    }

    Widget activity() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aktivitas saya',
              style: AppText.textBase.copyWith(
                fontWeight: AppText.medium,
                color: AppColorText.secondary,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Icon(
                  Icons.list_alt_outlined,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Transaksi',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.primary,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: AppColorGreyscale.lightActive,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.device_unknown_outlined,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Cek User ID dan Device ID',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.primary,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget general() {
      return Container(
        margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: 40,
            bottom: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Umum',
              style: AppText.textBase.copyWith(
                fontWeight: AppText.medium,
                color: AppColorText.secondary,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Icon(
                  Icons.notifications_active_outlined,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Pengaturan Notifikasi',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.primary,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: AppColorGreyscale.lightActive,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.key_rounded,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Ubah Password',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.primary,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: AppColorGreyscale.lightActive,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.language,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Pilih Bahasa',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.primary,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: AppColorGreyscale.lightActive,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.privacy_tip_outlined,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Kebijakan Privasi',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.primary,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: AppColorGreyscale.lightActive,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.logout_rounded,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Log Out',
                    style: AppText.textLarge.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.primary,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                )
              ],
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                profile(),
                divider(),
                activity(),
                general(),
              ],
            )),
      ),
    );
  }
}
