import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'infrastructure/package_info/package_info.dart';
import 'infrastructure/shared_preferences/shared_preferences.dart';
import 'infrastructure/supabase/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  late final PackageInfoInfrastructure packageInfoInfrastructure;
  late final SharedPreferencesInfrastructure sharedPreferencesInfrastructure;

  await Future.wait([
    SupabaseConfig.init(),
    Future(() async {
      packageInfoInfrastructure = await PackageInfoInfrastructure.init();
    }),
    Future(() async {
      sharedPreferencesInfrastructure =
          await SharedPreferencesInfrastructure.init();
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
