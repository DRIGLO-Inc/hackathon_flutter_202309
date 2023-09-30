import 'package:flutter/material.dart';

import '../match_room_start/match_room_start_page.dart';

class MatchRoomCreatePage extends StatelessWidget {
  const MatchRoomCreatePage._();

  static const routeName = '/match_room_create';

  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MatchRoomCreatePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('作成'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MatchRoomStartPage.route(
                    MatchRoomStartPageArgs(
                      // TODO(tsuda): 作成した matchRoomId を設定
                      matchRoomId: 'matchRoomId',
                    ),
                  ),
                  (route) => route.settings.name != routeName,
                );
              },
              child: const Text('始める'),
            ),
          ],
        ),
      ),
    );
  }
}
