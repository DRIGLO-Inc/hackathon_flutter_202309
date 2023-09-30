import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import 'custom_colors.dart';

class AppColorScheme {
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: CustomColors.primaryMain,
    onPrimary: CustomColors.grayShade0,
    secondary: CustomColors.secondaryBlue,
    onSecondary: CustomColors.grayShade0,
    error: CustomColors.accentRed,
    onError: ColorName.white,
    background: ColorName.white,
    onBackground: ColorName.black,
    surface: ColorName.gray100,
    onSurface: ColorName.black,
  );
}
