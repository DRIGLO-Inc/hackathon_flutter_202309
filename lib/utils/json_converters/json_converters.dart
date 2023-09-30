

import 'package:json_annotation/json_annotation.dart';

class SecondsDurationConverter implements JsonConverter<Duration, int> {
  const SecondsDurationConverter();

  @override
  Duration fromJson(int json) {
    return Duration(seconds: json);
  }

  @override
  int toJson(Duration object) {
    return object.inSeconds;
  }
}
