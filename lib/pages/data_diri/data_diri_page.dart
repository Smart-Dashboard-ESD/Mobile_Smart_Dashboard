import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/controllers/registerC.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/constant.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataDiriPage extends StatefulWidget {
  const DataDiriPage({super.key});

  @override
  State<DataDiriPage> createState() => _DataDiriPageState();
}

class _DataDiriPageState extends State<DataDiriPage> {
  final c = Get.find<RegisterC>();

  late SharedPreferences sharedPreferences;

  DateTime selected = DateTime.now();
  DateTime initial = DateTime(1900);
  DateTime last = DateTime(2100);

  Future displayDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: initial,
      lastDate: last,
    );

    if (date != null) {
      setState(() {
        c.birthdateController.text = date.day.toString() +
            "-" +
            date.month.toString() +
            "-" +
            date.year.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String namePref =
        sharedPreferences.getString(SharedPreferenceKey.name) ?? "";
    c.nameController.value = TextEditingValue(text: namePref);

    final String birthplacePref =
        sharedPreferences.getString(SharedPreferenceKey.birthplace) ?? "";
    c.birthplaceController.value = TextEditingValue(text: birthplacePref);

    final String birthdatePref =
        sharedPreferences.getString(SharedPreferenceKey.birthdate) ?? "";
    c.birthdateController.value = TextEditingValue(text: birthdatePref);

    final String genderPref =
        sharedPreferences.getString(SharedPreferenceKey.gender) ?? "";
    c.genderController.value = TextEditingValue(text: genderPref);
  }

  void storedata() {
    sharedPreferences.setString(
        SharedPreferenceKey.name, c.nameController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.birthplace, c.birthplaceController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.birthdate, c.birthdateController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.gender, c.genderController.text);
  }

  @override
  Widget build(BuildContext context) {
    Widget indicator() {
      return const LinearProgressIndicator(
        value: 2 / 4,
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

    Widget inputNamaLengkap() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Diri',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.blue),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Nama Lengkap',
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
                  controller: c.nameController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  style: AppText.textBase.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan nama lengkap anda',
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

    Widget inputTempatTanggalLahir() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tempat dan Tanggal Lahir',
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
                        controller: c.birthplaceController,
                        cursorColor: AppColorText.primary,
                        autocorrect: false,
                        style: AppText.textBase
                            .copyWith(fontWeight: AppText.medium),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Tempat',
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
                  child: GestureDetector(
                    onTap: () => displayDatePicker(context),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: c.birthdateController,
                              cursorColor: AppColorText.primary,
                              autocorrect: false,
                              style: AppText.textBase
                                  .copyWith(fontWeight: AppText.medium),
                              decoration: InputDecoration.collapsed(
                                hintText: 'Tanggal Lahir',
                                hintStyle: AppText.textBase.copyWith(
                                    fontSize: 12, fontWeight: AppText.medium),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColorText.secondary,
                          )
                        ],
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

    Widget inputJenisKelamin() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Kelamin',
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
                  controller: c.genderController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  style: AppText.textBase.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Ketik Pria/Wanita',
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
                Get.toNamed(Routes.alamat);
                storedata();
                print(c.nameController.text);
                print(c.nikController.text);
                print(c.birthplaceController.text);
                print(c.birthdateController.text);
                print(c.genderController.text);
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
                inputNamaLengkap(),
                inputTempatTanggalLahir(),
                inputJenisKelamin(),
                buttonNext(),
              ],
            )),
      ),
    );
  }
}
