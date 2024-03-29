import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/msg.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/my_msg_bubble.dart';
import 'package:yes_no_app/presentation/widgets/other_msg_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/msg_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.etsystatic.com/iusa/f6951f/104416746/iusa_75x75.104416746_75eg.jpg?version=0'),
          ),
        ),
        title: const Text('My chat app: '),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final msg = chatProvider.messageList[index];
                return msg.msgOrigin == MsgOrigin.other
                    ? OtherMsgBubble(msg: msg)
                    : MyMsgBubble(msgText: msg.text);
              },
            )),
            MsgFieldBox(
              onValue: chatProvider.sendMsg,
            )
          ],
        ),
      ),
    );
  }
}
