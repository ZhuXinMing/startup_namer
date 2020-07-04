import 'dart:ui';

import 'package:flutter/material.dart';

class ResColor {
  static const Color transparent_ba = Color(0xBA000000);
  static const Color BASE_COLOR = Color(0xffEF5D44);
  static const Color color_white = Color(0xffffffff);
  static const Color color_a6_white = Color(0xa6ffffff);
  static const Color color_FEC791 = Color(0xffFEC791);
  static const Color color_3F4251 = Color(0xff3F4251);
  static const Color color_FF714A = Color(0xffFF714A);
  static const Color color_DDDDDD= Color(0xffDDDDDD);
  static const Color color_EF5D44 = Color(0xffEF5D44);
  static const Color color_2F3A5B = Color(0xff2F3A5B);



  static const Color color_999 = Color(0xff999999);
  static const Color color_333 = Color(0xff333333);
  static const Color color_ccc = Color(0xffcccccc);
  static const Color color_F87A15 = Color(0xffF87A15);
  static const Color color_f7f7f7 = Color(0xfff7f7f7);
  static const Color color_3781CA = Color(0xff3781CA);
  static const Color color_f1f4f6 = Color(0xfff1f4f6);
  static const Color color_93989E = Color(0xff93989E);
  static const Color color_F54248 = Color(0xffF54248);
  static const Color color_EEEEEE = Color(0xffEEEEEE);
  static const Color color_E6E6E6= Color(0xffE6E6E6);
  static const Color color_3B4366 = Color(0xff3B4366);
  static const Color color_307DF4 = Color(0xff307DF4);
  static const Color color_007AFF = Color(0xff007AFF);
  static const Color color_F2F1F6 = Color(0xffF2F1F6);


}

class ColorsUtil {
  /// 十六进制颜色，ColorsUtil
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]
  static Color hexColor(int hex, {double alpha = 1}) {
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, alpha);
  }
}
