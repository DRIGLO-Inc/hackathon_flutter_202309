import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/color/custom_colors.dart';

class RoundedRectangleTextForm extends StatefulWidget {
  const RoundedRectangleTextForm({
    super.key,
    this.formFieldKey,
    this.controller,
    this.initialValue,
    this.prefixIcon,
    this.showObscureTextIcon = false,
    this.hintText,
    this.autoFocus = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 12, 16, 12),
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.validator,
    this.errorText,
    this.textHeight,
  }) : assert(
          formFieldKey != null || controller != null || onChanged != null,
          'formFieldKey、controller、onChangedのいずれかが必要です',
        );

  final GlobalKey<FormFieldState<String>>? formFieldKey;
  final TextEditingController? controller;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool showObscureTextIcon;
  final String? hintText;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsets contentPadding;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? errorText;
  final double? textHeight;

  @override
  State<RoundedRectangleTextForm> createState() =>
      _RectangleBorderTextFormState();
}

class _RectangleBorderTextFormState extends State<RoundedRectangleTextForm> {
  late bool _obscureText = widget.showObscureTextIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.formFieldKey,
      controller: widget.controller,
      initialValue: widget.initialValue,
      autofocus: widget.autoFocus,
      focusNode: widget.focusNode,
      obscureText: _obscureText,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      keyboardAppearance: Brightness.dark,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.maxLength),
      ],
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        fillColor: CustomColors.grayShade0,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.showObscureTextIcon
            ? Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: _obscureText
                      ? const Icon(
                          Icons.visibility_off_outlined,
                          // TODO(Tani1015): CustomColorに変更する
                          color: Colors.red,
                          size: 24,
                        )
                      : const Icon(
                          Icons.visibility,
                          // TODO(Tani1015): CustomColorに変更する
                          color: Colors.blue,
                          size: 24,
                        ),
                  onPressed: () {
                    setState(() => _obscureText = !_obscureText);
                  },
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.grayShade200),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.primaryMain),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.accentRed),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.accentRed),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        hintMaxLines: widget.minLines,
        errorText: widget.errorText,
      ),
      validator: widget.validator,
      style: TextStyle(height: widget.textHeight ?? 1.0),
      // style: context.bodyMedium,
    );
  }
}
