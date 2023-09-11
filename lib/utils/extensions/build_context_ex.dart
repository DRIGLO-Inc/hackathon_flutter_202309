import 'package:flutter/material.dart';

// ! あくまで、冗長な書き方の防止のみに使う
// ! 処理の共通化の用途のに使うのは禁止
extension BuildContextEx on BuildContext {
  void unfocus() {
    // https://github.com/flutter/flutter/issues/54277#issuecomment-640998757
    final currentScope = FocusScope.of(this);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  T pageArgs<T>() => ModalRoute.of(this)!.settings.arguments as T;
}
