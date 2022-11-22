import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_database/firebase_database.dart';
import 'bubble.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

List<Widget> bub = [];

class _ChatBotState extends State<ChatBot> {
  String name = "chat bot";
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: FirebaseAnimatedList(
              query: FirebaseDatabase.instance.ref()
                ..child('chatbot_responses/CathAI').get(),
              reverse: true,
              shrinkWrap: true,
              controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, snapshot, animation, index) {
                return MessageBubble(snapshot.value.toString());
              },
            ),
          ),
        ),
        NewMessageBar(),
      ],
    );
  }
}
