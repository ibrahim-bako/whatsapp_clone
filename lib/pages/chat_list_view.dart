import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/widgets/chat_list_tile.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ChatListTile(
          onTap: () {},
          avatar: const NetworkImage(
              "https://avatarfiles.alphacoders.com/130/thumb-150-130779.jpg"),
          name: "name",
          lastMessage:
              "Lorem ipsum dolor sit amet consectetur adipisicing elit.",
          lastMessageAt: DateTime.now(),
          nbNewMessage: 15,
          color: lightGreen,
        );
      },
    );
  }
}
