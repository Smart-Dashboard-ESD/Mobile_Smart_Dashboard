import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';

class FormPengaduanPage extends StatelessWidget {
  const FormPengaduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: AppColorPrimay.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {},
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

    Widget nextButton() {
      return GestureDetector(
        onTap: () {},
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
                nextButton(),
              ],
            )),
      ),
    );
  }
}
