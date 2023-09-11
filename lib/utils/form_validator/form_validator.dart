import 'package:form_validator/form_validator.dart' as form_validator;

part 'form_validator_messages.dart';

typedef ValidationBuilder = form_validator.ValidationBuilder;

final FormValidator formValidator = FormValidator.instance;

class FormValidator {
  FormValidator._() {
    setConfig();
  }

  static final _instance = FormValidator._();
  static FormValidator get instance => _instance;

  static void setConfig() {
    CustomValidatorLocale.setLocale();
  }

  String? Function(Object?) get required => (Object? value) {
        if (value == null) {
          return _validatorMessages.required();
        }
        return null;
      };

  /// ### 必須入力
  ///
  /// 連ねた順番に、バリデーターが走る
  ///
  /// #### ex.) 数字のチェックが入ってから、文字数のチェックが入る
  /// - あいうえおかきくけこ => .numeric() のエラーメッセージ
  /// - あいうえおかきくけこさ => .numeric() のエラーメッセージ
  /// - 12345678901 => .maxLength(10) のエラーメッセージ
  /// ```dart
  /// TextFormField(
  ///   validator: FormValidator.requiredBuilder.numeric().maxLength(10)
  /// )
  /// ```
  ValidationBuilder get requiredTextBuilder => ValidationBuilder();

  /// ### 任意入力
  ///
  /// 連ねた順番に、バリデーターが走る
  ///
  /// #### ex.) 数字のチェックが入ってから、文字数のチェックが入る
  /// - あいうえおかきくけこ => .numeric() のエラーメッセージ
  /// - あいうえおかきくけこさ => .numeric() のエラーメッセージ
  /// - 12345678901 => .maxLength(10) のエラーメッセージ
  /// ```dart
  /// TextFormField(
  ///   validator: FormValidator.optionalBuilder.numeric().maxLength(10)
  /// )
  /// ```
  ValidationBuilder get optionalTextBuilder =>
      ValidationBuilder(optional: true);
}

extension ValidationBuilderExtension on form_validator.ValidationBuilder {
  static CustomValidatorLocale? _getCustomLocale() {
    final currentLocale = form_validator.ValidationBuilder.globalLocale;
    if (currentLocale is CustomValidatorLocale) {
      return currentLocale;
    }

    return null;
  }

  ValidationBuilder equal(String v, String comparisonName, [String? message]) {
    return add(
      (value) => switch (value) {
        _ when value == null => null,
        _ when value == v => null,
        _ => message ??
            _getCustomLocale()?.equal(comparisonName) ??
            _validatorMessages.exception(),
      },
    );
  }

  ValidationBuilder length(int n, [String? message]) {
    return add(
      (value) => switch (value) {
        _ when value == null => null,
        _ when value.length == n => null,
        _ => message ??
            _getCustomLocale()?.length(n) ??
            _validatorMessages.exception(),
      },
    );
  }

  ValidationBuilder numeric([String? message]) => add(
        (value) => _numericCallback(value, message),
      );

  ValidationBuilder higherThan(int n, [String? message]) => add(
        (value) =>
            _numericCallback(value, message) ??
            (int.parse(value!) > n
                ? null
                : message ?? _validatorMessages.higherThan(n)),
      );

  ValidationBuilder higherThanOrEqual(int n, [String? message]) => add(
        (value) =>
            _numericCallback(value, message) ??
            (int.parse(value!) >= n
                ? null
                : message ?? _validatorMessages.higherThanOrEqual(n)),
      );

  ValidationBuilder lessThan(int n, [String? message]) => add(
        (value) =>
            _numericCallback(value, message) ??
            (int.parse(value!) < n
                ? null
                : message ?? _validatorMessages.lessThan(n)),
      );

  ValidationBuilder lessThanOrEqual(int n, [String? message]) => add(
        (value) =>
            _numericCallback(value, message) ??
            (int.parse(value!) <= n
                ? null
                : message ?? _validatorMessages.lessThanOrEqual(n)),
      );

  ValidationBuilder alphabet([String? message]) => add(
        (value) => value == null
            ? null
            : RegExp(r'^[a-zA-Z]+$').hasMatch(value)
                ? null
                : (message ?? _validatorMessages.numeric()),
      );

  ValidationBuilder numberOrAlphabet([String? message]) {
    final m = message ?? _validatorMessages.numberOrAlphabet();
    return or(
      (builder) => builder.numeric(m),
      (builder) => builder.alphabet(m),
    );
  }

  static String? Function(String? value, String? message)
      get _numericCallback => (String? value, String? message) => value == null
          ? null
          : RegExp(r'^[0-9]+$').hasMatch(value)
              ? null
              : (message ?? _validatorMessages.numeric());
}
