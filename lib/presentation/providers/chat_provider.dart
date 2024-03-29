import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_y_n_answer.dart';
import 'package:yes_no_app/domain/entities/msg.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMsg(String msg) async {
    if (msg.isEmpty) return;
    final newMsg = Message(text: msg, msgOrigin: MsgOrigin.me);

    updateMsgList(newMsg);
    if (msg.trim().endsWith('?')) await getTeply();
  }

  Future<void> getTeply() async {
    final msg = await getYesNoAnswer.getAnswer();
    updateMsgList(msg);
  }

  void updateMsgList(Message msg) {
    messageList.add(msg);
    notifyListeners();
    _moveScrollToBottom();
  }

  void _moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
