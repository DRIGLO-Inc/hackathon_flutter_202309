import 'package:flutter/material.dart';

class MatchRoomAfterStartView extends StatelessWidget {
  const MatchRoomAfterStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          const CustomScrollView(
            slivers: [
              SliverAppBar(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.paddingOf(context).bottom,
              ),
              // TODO(tsuda): ひらがなしか受け付けないキーボード
              child: const TextField(),
            ),
          ),
        ],
      ),
    );
  }
}
