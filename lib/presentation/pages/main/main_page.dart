import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/drawer.dart';

import '../../widgets/forms/search_text_field.dart';
import '../match_room_select/match_room_select_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  static const routeName = '/main';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MainPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      drawer: const MainPageDrawer(),
      floatingActionButton: FloatingActionButton.large(
        child: const Text('テストを\nつくる'),
        onPressed: () {
          Navigator.of(context).push(
            MatchRoomSelectPage.route(),
          );
        },
      ),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            sliver: SliverToBoxAdapter(
              child: SearchTextField(),
            ),
          ),
        ],
      ),
    );
  }
}
