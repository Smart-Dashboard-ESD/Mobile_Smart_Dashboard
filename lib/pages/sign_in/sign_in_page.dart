import 'package:flutter/material.dart';
import 'package:mobile_smart_dashboard/shared/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
  Widget build(BuildContext context) {
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
              onTap: () {},
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
                  onTap: () {},
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
