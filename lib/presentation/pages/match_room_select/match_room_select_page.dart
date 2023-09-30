import 'package:flutter/material.dart';

import '../match_room_create/match_room_create_page.dart';

class MatchRoomSelectPage extends StatelessWidget {
  const MatchRoomSelectPage._();

  static const routeName = '/match_room_select';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MatchRoomSelectPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ルームを選ぶ'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FilledButton(
              onPressed: () {
                Navigator.of(context).push(MatchRoomCreatePage.route());
              },
              child: const Text('ルームを作る'),
            ),
          ),
        ],
      ),
    );
  }
}
