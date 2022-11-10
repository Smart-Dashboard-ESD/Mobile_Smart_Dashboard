import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/constant.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NomorPendudukPage extends StatefulWidget {
  const NomorPendudukPage({super.key});

  @override
  State<NomorPendudukPage> createState() => _NomorPendudukPageState();
}

class _NomorPendudukPageState extends State<NomorPendudukPage> {
  TextEditingController nikController = TextEditingController();
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String nikPref =
        sharedPreferences.getString(SharedPreferenceKey.nik) ?? "";
    nikController.value = TextEditingValue(text: nikPref);
  }

  void storedata() {
    sharedPreferences.setString(SharedPreferenceKey.nik, nikController.text);
  }

  @override
  Widget build(BuildContext context) {
    Widget indicator() {
      return const LinearProgressIndicator(
        value: 1 / 4,
        backgroundColor: AppColorGreyscale.lightActive,
        minHeight: 10,
        valueColor: AlwaysStoppedAnimation<Color>(AppColorPrimay.normal),
      );
    }

    Widget header() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Isi Biodata',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Masukkan data diri personal untuk\ndapat mengakses Menu Utama',
              style: AppText.textSmall.copyWith(
                  fontWeight: AppText.medium, color: AppColorText.secondary),
            )
          ],
        ),
      );
    }

    Widget inputNomorPenduduk() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Penduduk :',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.blue),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'NIK',
              style: AppText.textBase.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColorPrimay.white,
                  border: Border.all(
                    color: AppColorText.secondary,
                  )),
              child: Center(
                child: TextFormField(
                  controller: nikController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  style: AppText.textBase.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan NIK anda',
                    hintStyle: AppText.textBase
                        .copyWith(fontSize: 12, fontWeight: AppText.medium),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget buttonNext() {
      return GestureDetector(
        onTap: () {
          Get.toNamed(Routes.datadiri);
          print(nikController.text);
          storedata();
        },
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(right: defaultMargin, top: 50),
            height: 36,
            width: 113,
            decoration: BoxDecoration(
                color: AppColorPrimay.normal,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                'Next',
                style: AppText.textSmall.copyWith(
                    fontWeight: AppText.medium, color: AppColorPrimay.white),
              ),
            ),
          ),
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
                indicator(),
                header(),
                inputNomorPenduduk(),
                buttonNext(),
              ],
            )),
      ),
    );
  }
}
