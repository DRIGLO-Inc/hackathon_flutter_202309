import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'font_family.dart';

const customTextTheme = CustomTextTheme._(
  header1: _defaultHeader1,
  header2: _defaultHeader2,
  header3: _defaultHeader3,
  header4: _defaultHeader4,
  header5: _defaultHeader5,
  body1: _defaultBody1,
  body2: _defaultBody2,
  body3: _defaultBody3,
  body4: _defaultBody4,
  body5: _defaultBody5,
  body6: _defaultBody6,
  body7: _defaultBody7,
  caption1: _defaultCaption1,
  caption2: _defaultCaption2,
  caption3: _defaultCaption3,
  caption4: _defaultCaption4,
  hidden: CustomTextStyle(
    fontSize: 0,
    height: -1,
    fontWeight: FontWeight.w300,
  ),
);

final typography = Typography(
  platform: defaultTargetPlatform,
  white: customTextTheme.materialTextTheme(),
);

class CustomTextTheme {
  const CustomTextTheme._({
    required this.header1,
    required this.header2,
    required this.header3,
    required this.header4,
    required this.header5,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.body4,
    required this.body5,
    required this.body6,
    required this.body7,
    required this.caption1,
    required this.caption2,
    required this.caption3,
    required this.caption4,
    required this.hidden,
  });

  /// default `fontSize: 36, fontWeight: w6`
  final CustomTextStyle header1;

  /// default `fontSize: 30, fontWeight: w6`
  final CustomTextStyle header2;

  /// default `fontSize: 28, fontWeight: w6`
  final CustomTextStyle header3;

  /// default `fontSize: 24, fontWeight: w6`
  final CustomTextStyle header4;

  /// default `fontSize: 22, fontWeight: w6`
  final CustomTextStyle header5;

  /// default `fontSize: 20, fontWeight: w3`
  final CustomTextStyle body1;

  /// default `fontSize: 18, fontWeight: w3`
  final CustomTextStyle body2;

  /// default `fontSize: 17, fontWeight: w3`
  final CustomTextStyle body3;

  /// default `fontSize: 16, fontWeight: w3`
  final CustomTextStyle body4;

  /// default `fontSize: 14, fontWeight: w3`
  final CustomTextStyle body5;

  /// default `fontSize: 14, fontWeight: w3, height: 2.0`
  final CustomTextStyle body6;

  /// default `fontSize: 13, fontWeight: w3`
  final CustomTextStyle body7;

  /// default `fontSize: 12, fontWeight: w3`
  final CustomTextStyle caption1;

  /// default `fontSize: 11, fontWeight: w3`
  final CustomTextStyle caption2;

  /// default `fontSize: 10, fontWeight: w3`
  final CustomTextStyle caption3;

  /// default `fontSize: 9, fontWeight: w3`
  final CustomTextStyle caption4;

  /// default `fontSize: 0, fontWeight: w3, height: -1`
  final CustomTextStyle hidden;

  // Flutter のデフォルト動作改善のため material.dart の TextThemeを定義している
  TextTheme materialTextTheme() {
    return TextTheme(
      headlineLarge: header2.copyWith(fontSize: 32),
      headlineMedium: header3,
      headlineSmall: header4,
      titleLarge: header5,
      // NOTE: TextFormField に適応される
      // https://github.com/flutter/flutter/issues/118267
      titleMedium: body4.copyWith(fontSize: 16),
      titleSmall: header5.copyWith(fontSize: 14),
      labelSmall: caption3,
      labelMedium: caption1,
      labelLarge: caption1.copyWith(fontSize: 14),
      bodySmall: body7,
      bodyMedium: body5,
      bodyLarge: body4,
    );
  }
}

const _defaultHeaderFontWeight = FontWeight.w600;
const _defaultHeader1 = CustomTextStyle(
  fontWeight: _defaultHeaderFontWeight,
  fontSize: 36,
  height: 1.5,
);
const _defaultHeader2 = CustomTextStyle(
  fontWeight: _defaultHeaderFontWeight,
  fontSize: 30,
  height: 1.5,
);
const _defaultHeader3 = CustomTextStyle(
  fontWeight: _defaultHeaderFontWeight,
  fontSize: 28,
  height: 1.5,
);
const _defaultHeader4 = CustomTextStyle(
  fontWeight: _defaultHeaderFontWeight,
  fontSize: 24,
  height: 1.5,
);
const _defaultHeader5 = CustomTextStyle(
  fontWeight: _defaultHeaderFontWeight,
  fontSize: 22,
  height: 1.5,
);

const _defaultBodyFontWeight = FontWeight.w300;
const _defaultBody1 = CustomTextStyle(
  fontWeight: _defaultBodyFontWeight,
  fontSize: 20,
);
const _defaultBody2 = CustomTextStyle(
  fontWeight: _defaultBodyFontWeight,
  fontSize: 18,
);
const _defaultBody3 = CustomTextStyle(
  fontWeight: _defaultBodyFontWeight,
  fontSize: 17,
);
const _defaultBody4 = CustomTextStyle(
  fontWeight: _defaultBodyFontWeight,
  fontSize: 16,
);
const _defaultBody5 = CustomTextStyle(
  fontWeight: _defaultBodyFontWeight,
  fontSize: 14,
);
const _defaultBody6 = CustomTextStyle(
  fontWeight: _defaultBodyFontWeight,
  fontSize: 14,
  height: 2,
);
const _defaultBody7 = CustomTextStyle(
  fontWeight: _defaultBodyFontWeight,
  fontSize: 13,
);

const _defaultCaptionFontWeight = FontWeight.w300;
const _defaultCaption1 = CustomTextStyle(
  fontWeight: _defaultCaptionFontWeight,
  fontSize: 12,
);
const _defaultCaption2 = CustomTextStyle(
  fontWeight: _defaultCaptionFontWeight,
  fontSize: 11,
);
const _defaultCaption3 = CustomTextStyle(
  fontWeight: _defaultCaptionFontWeight,
  fontSize: 10,
);
const _defaultCaption4 = CustomTextStyle(
  fontWeight: _defaultCaptionFontWeight,
  fontSize: 9,
);

/// 必須項目の null チェックをスキップし、共通のプロパティを設定するためのクラス
class CustomTextStyle extends TextStyle {
  const CustomTextStyle({
    required super.fontWeight,
    required super.fontSize,
    super.height,
  }) : super(fontFamily: defaultFontFamily);

  @override
  double get fontSize => super.fontSize!;
}
