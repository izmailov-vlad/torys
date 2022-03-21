import 'package:flutter/material.dart';
import 'package:torys/resources/theme.dart';

extension UbuntuTextStyle on TextStyle {
  static const fontFamilyRoboto = 'Ubuntu';

  static TextStyle s12w400(Color? color) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
        fontFamily: fontFamilyRoboto,
      );
  static TextStyle s14w400(Color? color) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
        fontFamily: fontFamilyRoboto,
      );
  static TextStyle s16w400(Color? color) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
        fontFamily: fontFamilyRoboto,
      );
}
