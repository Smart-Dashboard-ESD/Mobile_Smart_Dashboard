import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';

class DataDiriPage extends StatefulWidget {
  const DataDiriPage({super.key});

  @override
  State<DataDiriPage> createState() => _DataDiriPageState();
}

class _DataDiriPageState extends State<DataDiriPage> {
  final List<String> items = [
    'Laki - laki',
    'Perempuan',
  ];

  String? selectedValue;

  DateTime date = DateTime(2005, 01, 01);

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
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColorPrimay.white,
                        border: Border.all(
                          color: AppColorText.secondary,
                        )),
                    child: Center(
                      child: TextFormField(
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
                  width: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    if (newDate == null) return;
                    setState(() => date = newDate);
                  },
                  child: Container(
                    height: 46,
                    width: 130,
                    padding: const EdgeInsets.only(left: 16, right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColorPrimay.white,
                        border: Border.all(
                          color: AppColorText.secondary,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${date.year}/${date.month}/${date.day}',
                          style: AppText.textBase.copyWith(
                              fontSize: 12,
                              fontWeight: AppText.medium,
                              color: AppColorText.primary),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        ),
                      ],
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
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  'Jenis Kelamin',
                  style: AppText.textSmall.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.secondary),
                  overflow: TextOverflow.ellipsis,
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: AppText.textSmall.copyWith(
                                fontWeight: AppText.medium,
                                color: AppColorText.primary),
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
                iconEnabledColor: AppColorText.secondary,
                iconDisabledColor: Colors.grey,
                buttonHeight: 46,
                buttonWidth: double.infinity,
                buttonPadding: const EdgeInsets.only(left: 12, right: 8),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColorText.secondary,
                  ),
                  color: AppColorPrimay.white,
                ),
                itemHeight: 40,
                dropdownMaxHeight: 100,
                dropdownWidth:
                    MediaQuery.of(context).size.width - 2 * defaultMargin,
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
