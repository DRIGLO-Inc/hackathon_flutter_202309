import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/auth/use_cases/sign_out/sign_out.dart';
import '../../../../infrastructure/package_info/package_info.dart';
import '../../../../utils/extensions/navigator_state_ex.dart';
import '../../../providers/theme_switcher_notifier.dart';
import '../../../widgets/buttons/theme_switcher_button.dart';
import '../../../widgets/snack_bars/floating_snack_bar.dart';
import '../../auth_sign_in/auth_sign_in_page.dart';

class MainPageDrawer extends ConsumerWidget {
  const MainPageDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devicePadding = MediaQuery.paddingOf(context);

    final packageVersion = ref.watch(packageInfoProvider).version;

    Future<void> signOut() async {
      try {
        await ref.read(signOutProvider)();

        if (context.mounted) {
          await Navigator.of(context).pushAndRemoveAll(
            AuthSignInPage.route(const AuthSignInPageArgs()),
          );
        }
      } on Exception catch (_) {
        if (context.mounted) {
          FloatingSnackBar.showError(context, message: 'ログアウトに失敗しました');
        }
      }
    }

    return Drawer(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(
          top: devicePadding.top,
          bottom: devicePadding.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('バージョン'),
                    trailing: Text('$packageVersion'),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: signOut,
                      child: const Text('ログアウト'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Text('開発用'),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ThemeSwitcherButton(),
                const SizedBox(width: 16),
                Tooltip(
                  message: '端末のテーマに合わせる',
                  child: OutlinedButton(
                    onPressed: () {
                      ref.read(themeSwitcherNotifierProvider.notifier).reset();
                    },
                    child: const Icon(Icons.monitor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
