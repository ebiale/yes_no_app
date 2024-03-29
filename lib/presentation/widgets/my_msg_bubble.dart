import 'package:flutter/material.dart';

class MyMsgBubble extends StatelessWidget {
  final String msgText;
  const MyMsgBubble({super.key, required this.msgText});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              msgText,
              style: TextStyle(color: colors.onPrimary),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
