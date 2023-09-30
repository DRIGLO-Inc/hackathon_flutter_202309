import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String userId,
    required String userName,
  }) = _UserData;

  const UserData._();

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);
}
