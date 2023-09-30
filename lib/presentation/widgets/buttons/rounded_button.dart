import 'package:flutter/material.dart';

import '../../../utils/extensions/text_style_ex.dart';
import '../../theme/color/custom_colors.dart';
import '../../theme/typography/typography.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    this.width,
    this.height,
    required this.child,
    this.backgroundColor = CustomColors.primaryMain,
    this.foregroundColor = CustomColors.grayShade0,
    this.elevation = 0,
    this.side = BorderSide.none,
    this.isLoading = false,
    this.onTap,
    super.key,
  });

  final double? width;
  final double? height;
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final BorderSide side;
  final bool isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: const StadiumBorder().copyWith(side: side),
          textStyle: customTextTheme.body6.w6,
          elevation: elevation,
        ),
        onPressed: onTap,
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : Padding(
                padding: EdgeInsets.zero,
                child: child,
              ),
      ),
    );
  }
}
