import 'package:flutter/material.dart';

extension NavigatorStateEx on NavigatorState {
  Future<T?> pushAndRemoveAll<T extends Object?>(Route<T> newRoute) =>
      pushAndRemoveUntil(newRoute, (_) => false);
}
