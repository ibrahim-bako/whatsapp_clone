import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/pages/chat_list_view.dart';
import 'package:whatsapp_clone/pages/status_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tealGreen,
        title: Text('WhatsApp ${tabController.index}'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.photo_camera),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: 'Discs.',
            ),
            Tab(
              text: 'Actus',
            ),
            Tab(
              text: 'Appels',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ChatListView(),
          StatusListView(),
          Center(
            child: Text('Calls'),
          ),
        ],
      ),
      floatingActionButton: switch (tabController.index) {
        0 => FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.message),
          ),
        1 => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(0, 1.2), end: Offset.zero)
                        .animate(AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 300))
                          ..forward()),
                child: FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: Colors.green.shade100,
                  foregroundColor: tealGreen,
                  child: const Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.camera_alt),
              ),
            ],
          ),
        2 => FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.call),
          ),
        _ => null
      },
    );
  }
}
