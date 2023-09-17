import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'app.dart';
import 'infrastructure/package_info/package_info.dart';
import 'infrastructure/shared_preferences/shared_preferences.dart';
import 'infrastructure/supabase/supabase_config.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  late final PackageInfoInfrastructure packageInfoInfrastructure;
  late final SharedPreferencesInfrastructure sharedPreferencesInfrastructure;

  // DateFormat を日本語に
  Intl.defaultLocale = kDefaultDateLocale;
  
  await Future.wait([
    // Supabase
    SupabaseConfig.init(),

    // PackageInfo
    Future(() async {
      packageInfoInfrastructure = await PackageInfoInfrastructure.init();
    }),

    // SharedPreferences
    Future(() async {
      sharedPreferencesInfrastructure =
          await SharedPreferencesInfrastructure.init();
    }),

    // 縦固定
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),

    // タイムゾーン
    Future(() async {
      tz.initializeTimeZones();
      final currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(currentTimeZone));
    }),
  ]);

  final providerContainer = ProviderContainer(
    overrides: [
      packageInfoProvider.overrideWithValue(packageInfoInfrastructure),
      sharedPreferencesProvider
          .overrideWithValue(sharedPreferencesInfrastructure),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: providerContainer,
      child: const App(),
    ),
  );
}
