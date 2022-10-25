import 'package:flutter/material.dart';

double defaultMargin = 20.0;

class AppColorPrimay {
  static const Color light = Color(0xffe8f2f8);
  static const Color lightHover = Color(0xffddecf4);
  static const Color lightActive = Color(0xffb8d7e8);
  static const Color normal = Color(0xff1b7fb5);
  static const Color normalHover = Color(0xff1872a3);
  static const Color normalActive = Color(0xff166691);
  static const Color dark = Color(0xff145f88);
  static const Color darkHover = Color(0xff104c6d);
  static const Color darkActive = Color(0xff0c3951);
  static const Color darker = Color(0xff092c3f);
  static const Color background = Color(0xffF2F2F2);
  static const Color white = Color(0xffffffff);
}

class AppColorSuccess {
  static const Color light = Color(0xfff2f6e7);
  static const Color lightHover = Color(0xffebf2da);
  static const Color lightActive = Color(0xffd6e3b3);
  static const Color normal = Color(0xff7aa60b);
  static const Color normalHover = Color(0xff6e950a);
  static const Color normalActive = Color(0xff628509);
  static const Color dark = Color(0xff5c7d08);
  static const Color darkHover = Color(0xff496407);
  static const Color darkActive = Color(0xff374b05);
  static const Color darker = Color(0xff2b3a04);
}

class AppColorInfo {
  static const Color light = Color(0xffe6f8f9);
  static const Color lightHover = Color(0xffd9f4f6);
  static const Color lightActive = Color(0xffb1e8ed);
  static const Color normal = Color(0xff02b6c5);
  static const Color normalHover = Color(0xff02a4b1);
  static const Color normalActive = Color(0xff02929e);
  static const Color dark = Color(0xff028994);
  static const Color darkHover = Color(0xff016d76);
  static const Color darkActive = Color(0xff015259);
  static const Color darker = Color(0xff014045);
}

class AppColorWarning {
  static const Color light = Color(0xfffef5e7);
  static const Color lightHover = Color(0xfffdefda);
  static const Color lightActive = Color(0xfffbdeb3);
  static const Color normal = Color(0xfff3960a);
  static const Color normalHover = Color(0xffdb8709);
  static const Color normalActive = Color(0xffc27808);
  static const Color dark = Color(0xffb67108);
  static const Color darkHover = Color(0xff925a06);
  static const Color darkActive = Color(0xff6d4405);
  static const Color darker = Color(0xff553504);
}

class AppColorDanger {
  static const Color light = Color(0xfffbeae7);
  static const Color lightHover = Color(0xfff8dfdb);
  static const Color lightActive = Color(0xfff1bdb6);
  static const Color normal = Color(0xffd22912);
  static const Color normalHover = Color(0xffbd2510);
  static const Color normalActive = Color(0xffa8210e);
  static const Color dark = Color(0xff9e1f0e);
  static const Color darkHover = Color(0xff7e190b);
  static const Color darkActive = Color(0xff5e1208);
  static const Color darker = Color(0xff4a0e06);
}

class AppColorGreyscale {
  static const Color light = Color(0xfff4f4f4);
  static const Color lightHover = Color(0xffefefef);
  static const Color lightActive = Color(0xffdedede);
  static const Color normal = Color(0xff939393);
  static const Color normalHover = Color(0xff848484);
  static const Color normalActive = Color(0xff767676);
  static const Color dark = Color(0xff6e6e6e);
  static const Color darkHover = Color(0xff585858);
  static const Color darkActive = Color(0xff424242);
  static const Color darker = Color(0xff333333);
}

class AppColorBlack {
  static const Color light = Color(0xffececec);
  static const Color lightHover = Color(0xffe3e3e3);
  static const Color lightActive = Color(0xffc5c5c5);
  static const Color normal = Color(0xff444444);
  static const Color normalHover = Color(0xff3d3d3d);
  static const Color normalActive = Color(0xff363636);
  static const Color dark = Color(0xff333333);
  static const Color darkHover = Color(0xff292929);
  static const Color darkActive = Color(0xff1f1f1f);
  static const Color darker = Color(0xff181818);
}

class AppColorText {
  static const Color primary = Color(0xff444444);
  static const Color secondary = Color(0xff939393);
  static const Color textField = Color(0xff8F8F8F);
  static const Color blue = AppColorPrimay.normal;
}

class AppText {
  static const String fontFamily = "Inter";

  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  static const TextStyle textExtraSmall =
      TextStyle(fontFamily: fontFamily, fontSize: 10);

  static const TextStyle textSmall =
      TextStyle(fontFamily: fontFamily, fontSize: 12);

  static const TextStyle textBase =
      TextStyle(fontFamily: fontFamily, fontSize: 14);

  static const TextStyle textLarge =
      TextStyle(fontFamily: fontFamily, fontSize: 17);

  static const TextStyle textExtraLarge =
      TextStyle(fontFamily: fontFamily, fontSize: 20);

  static const TextStyle textTitle3 =
      TextStyle(fontFamily: fontFamily, fontSize: 29);
}
