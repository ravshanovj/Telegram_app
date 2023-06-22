import 'package:flutter/material.dart';
import 'package:telegram_app/view/chats/all_chats_page.dart';
import 'package:telegram_app/view/chats/bots_page.dart';
import 'package:telegram_app/view/chats/channels_page.dart';
import 'package:telegram_app/view/chats/groups_page.dart';
import 'package:telegram_app/view/chats/my_own_page.dart';
import 'package:telegram_app/view/drawer/home_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text(
          "SuperApp",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          labelStyle: const TextStyle(fontSize: 20),
          isScrollable: true,
          tabs: const [
            Tab(
              text: "All",
            ),
            Tab(
              text: "My Own",
            ),
            Tab(
              text: "Groups",
            ),
            Tab(
              text: "Channels",
            ),
            Tab(
              text: "Bots",
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(controller: _tabController, children: _widgets),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },child: const Icon(Icons.add),),
    );
  }
}

List<Widget> _widgets = const [
  AllChatsPage(),
  MyOwnPage(),
  GroupsPage(),
  ChannelsPage(),
  BotsPage()
];
