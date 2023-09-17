import 'package:flutter/widgets.dart';

extension TextStyleEx on TextStyle {
  TextStyle get w3 => copyWith(
        fontWeight: FontWeight.w300,
      );
  TextStyle get w6 => copyWith(
        fontWeight: FontWeight.w600,
      );
}
