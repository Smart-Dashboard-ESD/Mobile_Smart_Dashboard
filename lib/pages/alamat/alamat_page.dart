import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/controllers/userC.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/constant.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlamatPage extends StatefulWidget {
  const AlamatPage({super.key});

  @override
  State<AlamatPage> createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {
  final c = Get.find<UserC>();

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();

    final String provPref =
        sharedPreferences.getString(SharedPreferenceKey.province) ?? "";
    c.provinceController.value = TextEditingValue(text: provPref);

    final String kotaPref =
        sharedPreferences.getString(SharedPreferenceKey.city) ?? "";
    c.cityController.value = TextEditingValue(text: kotaPref);

    final String kecPref =
        sharedPreferences.getString(SharedPreferenceKey.kelurahan) ?? "";
    c.kelurahanController.value = TextEditingValue(text: kecPref);

    final String rtPref =
        sharedPreferences.getString(SharedPreferenceKey.rt) ?? "";
    c.rtController.value = TextEditingValue(text: rtPref);

    final String rwPref =
        sharedPreferences.getString(SharedPreferenceKey.rw) ?? "";
    c.rwController.value = TextEditingValue(text: rwPref);

    final String addressPref =
        sharedPreferences.getString(SharedPreferenceKey.address) ?? "";
    c.addressController.value = TextEditingValue(text: addressPref);
  }

  void storedata() {
    sharedPreferences.setString(
        SharedPreferenceKey.province, c.provinceController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.city, c.cityController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.kelurahan, c.kelurahanController.text);
    sharedPreferences.setString(SharedPreferenceKey.rt, c.rtController.text);
    sharedPreferences.setString(SharedPreferenceKey.rw, c.rwController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.address, c.addressController.text);
  }

  @override
  Widget build(BuildContext context) {
    Widget indicator() {
      return const LinearProgressIndicator(
        value: 3 / 4,
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

    Widget inputProvinsiKota() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat Lengkap',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.blue),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Provinsi dan Kota',
              style: AppText.textBase.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 46,
                    width: 163,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColorPrimay.white,
                        border: Border.all(
                          color: AppColorText.secondary,
                        )),
                    child: Center(
                      child: TextFormField(
                        controller: c.provinceController,
                        cursorColor: AppColorText.primary,
                        autocorrect: false,
                        style: AppText.textBase
                            .copyWith(fontWeight: AppText.medium),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Provinsi',
                          hintStyle: AppText.textBase.copyWith(
                              fontSize: 12, fontWeight: AppText.medium),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 46,
                    width: 163,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColorPrimay.white,
                        border: Border.all(
                          color: AppColorText.secondary,
                        )),
                    child: Center(
                      child: TextFormField(
                        controller: c.cityController,
                        cursorColor: AppColorText.primary,
                        autocorrect: false,
                        style: AppText.textBase
                            .copyWith(fontWeight: AppText.medium),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Kota/Kabupaten',
                          hintStyle: AppText.textBase.copyWith(
                              fontSize: 12, fontWeight: AppText.medium),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget inputKelurahanDesa() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kecamatan/Desa dan RT/RW',
              style: AppText.textBase.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 46,
                    width: 163,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColorPrimay.white,
                        border: Border.all(
                          color: AppColorText.secondary,
                        )),
                    child: Center(
                      child: TextFormField(
                        controller: c.kelurahanController,
                        cursorColor: AppColorText.primary,
                        autocorrect: false,
                        style: AppText.textBase
                            .copyWith(fontWeight: AppText.medium),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Kecamatan/Desa',
                          hintStyle: AppText.textBase.copyWith(
                              fontSize: 12, fontWeight: AppText.medium),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 46,
                  width: 83,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColorPrimay.white,
                      border: Border.all(
                        color: AppColorText.secondary,
                      )),
                  child: Center(
                    child: TextFormField(
                      controller: c.rtController,
                      cursorColor: AppColorText.primary,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style:
                          AppText.textBase.copyWith(fontWeight: AppText.medium),
                      decoration: InputDecoration.collapsed(
                        hintText: 'RT',
                        hintStyle: AppText.textBase
                            .copyWith(fontSize: 12, fontWeight: AppText.medium),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 46,
                  width: 83,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColorPrimay.white,
                      border: Border.all(
                        color: AppColorText.secondary,
                      )),
                  child: Center(
                    child: TextFormField(
                      controller: c.rwController,
                      cursorColor: AppColorText.primary,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      style:
                          AppText.textBase.copyWith(fontWeight: AppText.medium),
                      decoration: InputDecoration.collapsed(
                        hintText: 'RW',
                        hintStyle: AppText.textBase
                            .copyWith(fontSize: 12, fontWeight: AppText.medium),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget inputDetailAlamat() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Alamat',
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
                  controller: c.addressController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  style: AppText.textBase.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan nama jalan dan no rumah anda',
                    hintStyle: AppText.textBase.copyWith(
                        fontSize: 12,
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonNext() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Text(
                'Previous',
                style: AppText.textSmall.copyWith(
                    fontWeight: AppText.medium, color: AppColorPrimay.normal),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.usernameandpassword);
                print(c.provinceController.text);
                print(c.cityController.text);
                print(c.kelurahanController.text);
                print(c.rtController.text);
                print(c.rwController.text);
                print(c.addressController.text);
                storedata();
              },
              child: Container(
                height: 36,
                width: 113,
                decoration: BoxDecoration(
                    color: AppColorPrimay.normal,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'Next',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.medium,
                        color: AppColorPrimay.white),
                  ),
                ),
              ),
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
                indicator(),
                header(),
                inputProvinsiKota(),
                inputKelurahanDesa(),
                inputDetailAlamat(),
                buttonNext(),
              ],
            )),
      ),
    );
  }
}
