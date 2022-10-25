import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:http/http.dart' as http;

class AlamatPage extends StatefulWidget {
  const AlamatPage({super.key});

  @override
  State<AlamatPage> createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {
  List<dynamic> _dataProv = [];
  List<dynamic> _dataDist = [];
  List<dynamic> _dataSubDist = [];
  String? _getProv;
  String? _nameProv;
  String? _getDist;
  String? _nameDist;
  String? _getSubDist;
  String? _nameSubDist;
  bool disableSubDist = false;

  void getProv() async {
    final respose = await http.get(
        Uri.parse("https://dev.farizdotid.com/api/daerahindonesia/provinsi"),
        headers: {"Accept": "application/json"});
    var listData = jsonDecode(respose.body)["provinsi"];
    setState(() {
      _dataProv = listData;
    });
  }

  void getDetailProv() async {
    final respose = await http.get(
        Uri.parse("https://dev.farizdotid.com/api/daerahindonesia/provinsi/" +
            _getProv! +
            ""),
        headers: {"Accept": "application/json"});
    var listData = jsonDecode(respose.body);
    setState(() {
      _nameProv = listData['nama'];
    });
  }

  void getDistrict() async {
    final respose = await http.get(
        Uri.parse(
            "https://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=" +
                _getProv! +
                ""),
        headers: {"Accept": "application/json"});
    var listData = jsonDecode(respose.body)["kota_kabupaten"];
    setState(() {
      _dataDist = listData;
    });
    print("data : $listData");
  }

  void getDetailDistrict() async {
    final respose = await http.get(
        Uri.parse("https://dev.farizdotid.com/api/daerahindonesia/kota/" +
            _getDist! +
            ""),
        headers: {"Accept": "application/json"});
    var listData = jsonDecode(respose.body);
    setState(() {
      _nameDist = listData['nama'];
    });
  }

  void getSubDistrict() async {
    final respose = await http.get(
        Uri.parse(
            "http://dev.farizdotid.com/api/daerahindonesia/kecamatan?id_kota=" +
                _getDist!),
        headers: {"Accept": "application/json"});
    var listData = jsonDecode(respose.body)["kecamatan"];
    setState(() {
      _dataSubDist = listData;
    });
    print("data : $listData");
  }

  void getDetailSubDistrict() async {
    final respose = await http.get(
        Uri.parse("https://dev.farizdotid.com/api/daerahindonesia/kecamatan/" +
            _getSubDist! +
            ""),
        headers: {"Accept": "application/json"});
    var listData = jsonDecode(respose.body);
    setState(() {
      _nameSubDist = listData['nama'];
    });
  }

  @override
  void initState() {
    getProv();
    super.initState();
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
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      'Provinsi',
                      style: AppText.textSmall.copyWith(
                          fontWeight: AppText.medium,
                          color: AppColorText.secondary),
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: _dataProv
                        .map((item) => DropdownMenuItem<String>(
                              value: item['id'].toString(),
                              child: Text(
                                item['nama'],
                                style: AppText.textSmall.copyWith(
                                    fontWeight: AppText.medium,
                                    color: AppColorText.primary),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: _getProv,
                    onChanged: (value) {
                      setState(() {
                        disableSubDist = true;
                        _nameDist = null;
                        _nameSubDist = null;
                        _getDist = null;
                        _getSubDist = null;
                        _getProv = value;
                        getDetailProv();
                        getDistrict();
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    iconSize: 25,
                    iconEnabledColor: AppColorText.secondary,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 46,
                    buttonWidth: 163,
                    buttonPadding: const EdgeInsets.only(left: 12, right: 8),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColorText.secondary,
                      ),
                      color: AppColorPrimay.white,
                    ),
                    itemHeight: 40,
                    dropdownMaxHeight: 200,
                    dropdownWidth: 163,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColorPrimay.white,
                    ),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      'Kota',
                      style: AppText.textSmall.copyWith(
                          fontWeight: AppText.medium,
                          color: AppColorText.secondary),
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: _dataDist
                        .map((item) => DropdownMenuItem<String>(
                              value: item['id'].toString(),
                              child: Text(
                                item['nama'],
                                style: AppText.textSmall.copyWith(
                                    fontWeight: AppText.medium,
                                    color: AppColorText.primary),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: _getDist,
                    onChanged: (value) {
                      setState(() {
                        disableSubDist = false;
                        _nameSubDist = null;
                        _getSubDist = null;
                        _getDist = value;
                        getDetailDistrict();
                        getSubDistrict();
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    iconSize: 25,
                    iconEnabledColor: AppColorText.secondary,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 46,
                    buttonWidth: 163,
                    buttonPadding: const EdgeInsets.only(left: 12, right: 8),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColorText.secondary,
                      ),
                      color: AppColorPrimay.white,
                    ),
                    itemHeight: 40,
                    dropdownMaxHeight: 200,
                    dropdownWidth: 163,
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
          ],
        ),
      );
    }

    Widget inputKelurahanDesa(enableSubDist) {
      return IgnorePointer(
        ignoring: enableSubDist,
        child: Container(
          margin: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kelurahan/Desa dan RT/RW',
                style: AppText.textBase.copyWith(
                    fontWeight: AppText.semiBold, color: AppColorText.primary),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Kelurahan/Desa',
                        style: AppText.textSmall.copyWith(
                            fontWeight: AppText.medium,
                            color: AppColorText.secondary),
                        overflow: TextOverflow.ellipsis,
                      ),
                      items: _dataSubDist
                          .map((item) => DropdownMenuItem<String>(
                                value: item['id'].toString(),
                                child: Text(
                                  item['nama'],
                                  style: AppText.textSmall.copyWith(
                                      fontWeight: AppText.medium,
                                      color: AppColorText.primary),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: _getSubDist,
                      onChanged: (value) {
                        setState(() {
                          _getSubDist = value;
                          getDetailSubDistrict();
                        });
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                      ),
                      iconSize: 25,
                      iconEnabledColor: AppColorText.secondary,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 46,
                      buttonWidth: 163,
                      buttonPadding: const EdgeInsets.only(left: 12, right: 8),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColorText.secondary,
                        ),
                        color: AppColorPrimay.white,
                      ),
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      dropdownWidth: 163,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColorPrimay.white,
                      ),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 46,
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
                            hintText: 'RT',
                            hintStyle: AppText.textBase.copyWith(
                                fontSize: 12,
                                fontWeight: AppText.medium,
                                color: AppColorText.secondary),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
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
                          style: AppText.textBase
                              .copyWith(fontWeight: AppText.medium),
                          decoration: InputDecoration.collapsed(
                            hintText: 'RW',
                            hintStyle: AppText.textBase.copyWith(
                                fontSize: 12,
                                fontWeight: AppText.medium,
                                color: AppColorText.secondary),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
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
              onTap: () {},
              child: Text(
                'Previous',
                style: AppText.textSmall.copyWith(
                    fontWeight: AppText.medium, color: AppColorPrimay.normal),
              ),
            ),
            GestureDetector(
              onTap: () {},
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
                inputKelurahanDesa(disableSubDist),
                inputDetailAlamat(),
                buttonNext(),
              ],
            )),
      ),
    );
  }
}
