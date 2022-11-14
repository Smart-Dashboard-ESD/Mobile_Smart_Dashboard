import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/controllers/userC.dart';
import 'package:mobile_smart_dashboard/providers/auth_provider.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/constant.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsernameAndPasswordPage extends StatefulWidget {
  const UsernameAndPasswordPage({super.key});

  @override
  State<UsernameAndPasswordPage> createState() => _UsernameAndPasswordState();
}

class _UsernameAndPasswordState extends State<UsernameAndPasswordPage> {
  final c = Get.find<UserC>();

  late SharedPreferences sharedPreferences;

  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialGetSavedData();
  }

  void initialGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String usernamePref =
        sharedPreferences.getString(SharedPreferenceKey.username) ?? "";
    c.usernameController.value = TextEditingValue(text: usernamePref);

    final String passwordPref =
        sharedPreferences.getString(SharedPreferenceKey.password) ?? "";
    c.passwordController.value = TextEditingValue(text: passwordPref);
  }

  void storedata() {
    sharedPreferences.setString(
        SharedPreferenceKey.username, c.usernameController.text);
    sharedPreferences.setString(
        SharedPreferenceKey.password, c.passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      storedata();
      if (await authProvider.register(
        nik: c.nikController.text,
        name: c.nameController.text,
        birthplace: c.birthplaceController.text,
        birthdate: c.birthdateController.text,
        gender: c.genderController.text,
        province: c.provinceController.text,
        // city: c.cityController.text,
        // kelurahan: c.kelurahanController.text,
        rt: c.rtController.text,
        rw: c.rwController.text,
        address: c.addressController.text,
        username: c.usernameController.text,
        password: c.passwordController.text,
      )) {
        Get.toNamed(Routes.successregister);
        await sharedPreferences.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: AppColorDanger.normal,
            content: Text(
              'Gagal Register',
              textAlign: TextAlign.center,
            )));
      }
    }

    Widget indicator() {
      return const LinearProgressIndicator(
        value: 4 / 4,
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

    Widget inputUsername() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username & Password :',
              style: AppText.textLarge.copyWith(
                  fontWeight: AppText.semiBold, color: AppColorText.blue),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Username',
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
                  controller: c.usernameController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  style: AppText.textBase.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan username anda',
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

    // Widget inputNomorTelepon() {
    //   return Container(
    //     margin:
    //         EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 8),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Nomor Telepon',
    //           style: AppText.textBase.copyWith(
    //               fontWeight: AppText.semiBold, color: AppColorText.primary),
    //         ),
    //         const SizedBox(
    //           height: 8,
    //         ),
    //         Container(
    //           height: 46,
    //           padding: const EdgeInsets.symmetric(horizontal: 16),
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(4),
    //               color: AppColorPrimay.white,
    //               border: Border.all(
    //                 color: AppColorText.secondary,
    //               )),
    //           child: Center(
    //             child: TextFormField(
    //               controller: nomorteleponController,
    //               cursorColor: AppColorText.primary,
    //               autocorrect: false,
    //               keyboardType: TextInputType.number,
    //               style: AppText.textBase.copyWith(fontWeight: AppText.medium),
    //               decoration: InputDecoration.collapsed(
    //                 hintText: 'Masukkan nomor telepon anda',
    //                 hintStyle: AppText.textBase
    //                     .copyWith(fontSize: 12, fontWeight: AppText.medium),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }

    Widget passwordInput() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: c.passwordController,
                        obscureText: _obscured,
                        cursorColor: AppColorText.primary,
                        autocorrect: false,
                        style: AppText.textSmall
                            .copyWith(fontWeight: AppText.medium),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan password anda',
                          hintStyle: AppText.textSmall.copyWith(
                              fontSize: 12, fontWeight: AppText.medium),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _toggleObscured,
                      child: Icon(
                        _obscured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 18,
                        color: AppColorText.primary,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    // Widget passwordConfirInput() {
    //   return Container(
    //     margin:
    //         EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 8),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Konfirmasi Password',
    //           style: AppText.textBase.copyWith(
    //               fontWeight: AppText.semiBold, color: AppColorText.primary),
    //         ),
    //         const SizedBox(
    //           height: 8,
    //         ),
    //         Container(
    //           height: 46,
    //           padding: const EdgeInsets.symmetric(horizontal: 16),
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(4),
    //               color: AppColorPrimay.white,
    //               border: Border.all(
    //                 color: AppColorText.secondary,
    //               )),
    //           child: Center(
    //             child: Row(
    //               children: [
    //                 Expanded(
    //                   child: TextFormField(
    //                     controller: passwordConfirController,
    //                     obscureText: _obscured,
    //                     cursorColor: AppColorText.primary,
    //                     autocorrect: false,
    //                     style: AppText.textSmall
    //                         .copyWith(fontWeight: AppText.medium),
    //                     decoration: InputDecoration.collapsed(
    //                       hintText: 'Masukkan konfirmasi password anda',
    //                       hintStyle: AppText.textSmall.copyWith(
    //                           fontSize: 12, fontWeight: AppText.medium),
    //                     ),
    //                   ),
    //                 ),
    //                 GestureDetector(
    //                   onTap: _toggleObscured,
    //                   child: Icon(
    //                     _obscured
    //                         ? Icons.visibility_off_outlined
    //                         : Icons.visibility_outlined,
    //                     size: 18,
    //                     color: AppColorText.primary,
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }

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
              onTap: handleSignUp,
              child: Container(
                height: 36,
                width: 113,
                decoration: BoxDecoration(
                    color: AppColorPrimay.normal,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    'Get Started',
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
                inputUsername(),
                // inputNomorTelepon(),
                passwordInput(),
                // passwordConfirInput(),
                buttonNext(),
              ],
            )),
      ),
    );
  }
}
