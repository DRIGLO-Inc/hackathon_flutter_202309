import 'package:flutter/material.dart';

class MockChatRoom extends StatelessWidget {
  const MockChatRoom._();

  static const routeName = '/_mock_chat_room';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MockChatRoom._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('モックチャットルーム')),
      body: const Center(child: Text('MockChatRoom')),
    );
  }
}
