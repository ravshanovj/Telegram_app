import 'package:flutter/material.dart';
import 'package:telegram_app/core/widgets/chats_builder.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatsBuilder()
    );
  }
}
