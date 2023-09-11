part of 'form_validator.dart';

final _validatorMessages = FormValidatorMessages.instance;

class FormValidatorMessages {
  FormValidatorMessages._();

  static final _instance = FormValidatorMessages._();
  static FormValidatorMessages get instance => _instance;


  String required() => '必須入力です';

  String maxLength(int n) => '$n文字までしか入力できません';
  String minLength(int n) => '$n文字まで入力してください';
  String equal(String comparisonName) => '$comparisonNameと一致しません';
  String higherThan(int n) => '$nより高い数字で入力してください';
  String higherThanOrEqual(int n) => '$n以上の数字で入力してください';
  String lessThan(int n) => '$n未満の数字で入力してください';
  String lessThanOrEqual(int n) => '$n以下の数字で入力してください';
  String length(int n) => '$n文字で入力してください';
  String numeric() => '数字で入力してください';
  String numberOrAlphabet() => '半角英数字で入力してください';

  String exception() => '正しいフォーマットではありません';
}

class CustomValidatorLocale extends form_validator.FormValidatorLocale {
  static void setLocale() {
    form_validator.ValidationBuilder.globalLocale = CustomValidatorLocale();
  }

  @override
  String required() => _validatorMessages.required();

  @override
  String maxLength(String v, int n) => _validatorMessages.maxLength(n);

  @override
  String minLength(String v, int n) => _validatorMessages.minLength(n);

  @override
  String name() => _validatorMessages.exception();

  @override
  String email(String v) => _validatorMessages.exception();

  @override
  String ip(String v) => _validatorMessages.exception();

  @override
  String ipv6(String v) => _validatorMessages.exception();

  @override
  String phoneNumber(String v) => _validatorMessages.exception();

  @override
  String url(String v) => _validatorMessages.exception();

  String equal(String comparisonName) =>
      _validatorMessages.equal(comparisonName);

  String length(int n) => _validatorMessages.length(n);
}
