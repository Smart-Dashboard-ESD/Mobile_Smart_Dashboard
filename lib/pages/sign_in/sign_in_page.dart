import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/controllers/userC.dart';
import 'package:mobile_smart_dashboard/providers/auth_provider.dart';
import 'package:mobile_smart_dashboard/routes/app_page.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final c = Get.find<UserC>();
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  late SharedPreferences sharedPreferences;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      }
      textFieldFocusNode.canRequestFocus = false;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   initialGetSavedData();
  // }

  // void initialGetSavedData() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   final String usernamePref =
  //       sharedPreferences.getString(SharedPreferenceKey.username) ?? "";
  //   c.usernameController.value = TextEditingValue(text: usernamePref);

  //   final String passwordPref =
  //       sharedPreferences.getString(SharedPreferenceKey.password) ?? "";
  //   c.passwordController.value = TextEditingValue(text: passwordPref);
  // }

  // void storedata() {
  //   sharedPreferences.setString(
  //       SharedPreferenceKey.username, c.usernameController.text);
  //   sharedPreferences.setString(
  //       SharedPreferenceKey.password, c.passwordController.text);
  // }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      if (await authProvider.login(
          username: c.usernameController.text,
          password: c.passwordController.text)) {
        Get.toNamed(Routes.main);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: AppColorDanger.normal,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            )));
      }
      // storedata();
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(left: 32, right: 32, top: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/bitmap/logo_pt_icon.png',
              height: 65,
              width: 65,
            ),
            const SizedBox(
              height: 32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: AppText.textLarge.copyWith(
                      fontWeight: AppText.semiBold,
                      color: AppColorText.primary),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Daftar dengan menggunakan data diri\nyang sesuai',
                  style: AppText.textSmall.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.secondary),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: const EdgeInsets.only(left: 32, right: 32, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: AppText.textSmall.copyWith(
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
                  controller: c.usernameController,
                  cursorColor: AppColorText.primary,
                  autocorrect: false,
                  style: AppText.textSmall.copyWith(fontWeight: AppText.medium),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Masukkan username anda',
                    hintStyle: AppText.textSmall
                        .copyWith(fontSize: 12, fontWeight: AppText.medium),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: const EdgeInsets.only(left: 32, right: 32, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: AppText.textSmall.copyWith(
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

    Widget signInButton() {
      return Container(
        margin: const EdgeInsets.only(left: 32, right: 32, top: 25),
        child: Column(
          children: [
            GestureDetector(
              onTap: handleSignIn,
              child: Container(
                height: 51,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColorPrimay.normal),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: AppText.textBase.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColorPrimay.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  'Belum memiliki akun? ',
                  style: AppText.textSmall.copyWith(
                      fontWeight: AppText.medium,
                      color: AppColorText.secondary),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.nomorpenduduk);
                  },
                  child: Text(
                    'Sign Up',
                    style: AppText.textSmall.copyWith(
                        fontWeight: AppText.semiBold, color: AppColorText.blue),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColorPrimay.white,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/bitmap/background1_logreg_image.png',
                scale: 3.2,
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/bitmap/background2_logreg_image.png',
                  scale: 5,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                usernameInput(),
                passwordInput(),
                signInButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
