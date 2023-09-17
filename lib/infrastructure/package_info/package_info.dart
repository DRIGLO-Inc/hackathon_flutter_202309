import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pub_semver/pub_semver.dart';

final packageInfoProvider =
    Provider<PackageInfoInfrastructure>((ref) => throw UnimplementedError());

class PackageInfoInfrastructure {
  PackageInfoInfrastructure(this._packageInfo);

  final PackageInfo _packageInfo;

  static Future<PackageInfoInfrastructure> init() async {
    final packageInfo = await PackageInfo.fromPlatform();

    return PackageInfoInfrastructure(packageInfo);
  }

  Version get version => Version.parse(_packageInfo.version);
  String get buildNumber => _packageInfo.buildNumber;
  String get packageName => _packageInfo.packageName;
  String get bundleId => _packageInfo.packageName;

  bool isUnderVersion(String minimumVersion) {
    final current = version;
    final other = Version.parse(minimumVersion);

    return current.compareTo(other) < 0;
  }
}
