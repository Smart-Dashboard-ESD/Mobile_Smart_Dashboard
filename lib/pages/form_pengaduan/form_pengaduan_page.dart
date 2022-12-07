import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/controllers/feedbackC.dart';
import 'package:mobile_smart_dashboard/providers/feedback_provider.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/constant.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPengaduanPage extends StatefulWidget {
  const FormPengaduanPage({super.key});

  @override
  State<FormPengaduanPage> createState() => _FormPengaduanPageState();
}

class _FormPengaduanPageState extends State<FormPengaduanPage> {
  final feedbackC = Get.find<FeedbackC>();

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String namePref =
        sharedPreferences.getString(SharedPreferenceKey.nameF) ?? "";
    feedbackC.nameController.value = TextEditingValue(text: namePref);

    final String kodeAlatPref =
        sharedPreferences.getString(SharedPreferenceKey.kodeAlat) ?? "";
    feedbackC.kodeAlatController.value = TextEditingValue(text: kodeAlatPref);

    final String addressPref =
        sharedPreferences.getString(SharedPreferenceKey.addressF) ?? "";
    feedbackC.addressController.value = TextEditingValue(text: addressPref);

    final String nomorTeleponPref =
        sharedPreferences.getString(SharedPreferenceKey.nomorteleponF) ?? "";
    feedbackC.noHpController.value = TextEditingValue(text: nomorTeleponPref);

    final String feedbackPref =
        sharedPreferences.getString(SharedPreferenceKey.feedback) ?? "";
    feedbackC.keluhanController.value = TextEditingValue(text: feedbackPref);
  }

  void storedata() {
    sharedPreferences.setString(
        SharedPreferenceKey.name, feedbackC.nameController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.kodeAlat, feedbackC.kodeAlatController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.addressF, feedbackC.addressController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.nomorteleponF, feedbackC.noHpController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.feedback, feedbackC.keluhanController.text);
  }

  @override
  Widget build(BuildContext context) {
    FeedbackProvider feedbackProvider = Provider.of<FeedbackProvider>(context);

    handleSubmit() async {
      storedata();
      if (await feedbackProvider.feedback(
        name: feedbackC.nameController.text,
        kodeAlat: feedbackC.kodeAlatController.text,
        address: feedbackC.addressController.text,
        noHp: feedbackC.noHpController.text,
        feedback: feedbackC.keluhanController.text,
      )) {
        Get.toNamed(Routes.main);
        await sharedPreferences.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: AppColorDanger.normal,
            content: Text(
              'Gagal Mengirim Feedback',
              textAlign: TextAlign.center,
            )));
      }
    }

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
          'Form Pengaduan',
          style: AppText.textLarge.copyWith(
              fontWeight: AppText.medium, color: AppColorText.primary),
        ),
      );
    }

    Widget namaLengkapInput() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  border: Border.all(
                    color: AppColorText.secondary,
                  )),
              child: Center(
                child: TextFormField(
                  controller: feedbackC.nameController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  style: AppText.textSmall.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan nama lengkap anda',
                    hintStyle: AppText.textSmall.copyWith(
                        fontSize: 12,
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget kodeAlatInput() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kode Alat',
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
                  border: Border.all(
                    color: AppColorText.secondary,
                  )),
              child: Center(
                child: TextFormField(
                  controller: feedbackC.kodeAlatController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  style: AppText.textSmall.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan kode alat anda',
                    hintStyle: AppText.textSmall.copyWith(
                        fontSize: 12,
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget alamatInput() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alamat',
              style: AppText.textBase.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColorText.secondary,
                  )),
              child: TextFormField(
                controller: feedbackC.addressController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: AppColorText.primary,
                autocorrect: false,
                style: AppText.textSmall.copyWith(fontWeight: AppText.medium),
                decoration: InputDecoration.collapsed(
                  hintText: 'Masukkan alamat anda',
                  hintStyle: AppText.textSmall.copyWith(
                      fontSize: 12,
                      fontWeight: AppText.medium,
                      color: AppColorText.secondary),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget nomorTelfonInput() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Telepon',
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
                  border: Border.all(
                    color: AppColorText.secondary,
                  )),
              child: Center(
                child: TextFormField(
                  controller: feedbackC.noHpController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  style: AppText.textSmall.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan nomor telepon anda',
                    hintStyle: AppText.textSmall.copyWith(
                        fontSize: 12,
                        fontWeight: AppText.medium,
                        color: AppColorText.secondary),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget keluhanInput() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keluhan',
              style: AppText.textBase.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColorText.secondary,
                  )),
              child: TextFormField(
                controller: feedbackC.keluhanController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: AppColorText.primary,
                autocorrect: false,
                style: AppText.textSmall.copyWith(fontWeight: AppText.medium),
                decoration: InputDecoration.collapsed(
                  hintText: 'Masukkan keluhan anda',
                  hintStyle: AppText.textSmall.copyWith(
                      fontSize: 12,
                      fontWeight: AppText.medium,
                      color: AppColorText.secondary),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget submitButton() {
      return GestureDetector(
        onTap: handleSubmit,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 39,
            width: 86,
            margin: EdgeInsets.only(top: 25, right: defaultMargin),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColorText.blue),
            child: Center(
              child: Text(
                'Submit',
                style: AppText.textBase.copyWith(
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
                header(),
                namaLengkapInput(),
                kodeAlatInput(),
                alamatInput(),
                nomorTelfonInput(),
                keluhanInput(),
                submitButton(),
              ],
            )),
      ),
    );
  }
}
