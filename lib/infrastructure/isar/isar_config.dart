import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart' as path_lib;

import '../../exceptions/app_exception.dart';
import '../../utils/logger.dart';

class IsarConfig {
  const IsarConfig(this._isar);

  final Isar _isar;

  static late final IsarConfig instance;

  static Future<void> init() async {
    final directory = await path_lib.getApplicationDocumentsDirectory();
    final path = directory.path;

    const schemes = <CollectionSchema<dynamic>>[];

    if (schemes.isEmpty) {
      return;
    }

    final isar = await Isar.open(schemes, directory: path);

    instance = IsarConfig(isar);
  }

  Future<T> run<T>(FutureOr<T> Function(Isar isar) run) async {
    try {
      return await run(_isar);
    } on Exception catch (e) {
      logger.error(e);

      throw AppException.error(e);
    }
  }

  T runSync<T>(T Function(Isar isar) run) {
    try {
      return run(_isar);
    } on Exception catch (e) {
      logger.error(e);

      throw AppException.error(e);
    }
  }
}
