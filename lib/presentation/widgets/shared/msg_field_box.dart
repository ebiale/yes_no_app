import 'package:flutter/material.dart';

class MsgFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MsgFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        filled: true,
        suffixIcon: IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {
              final textValue = textController.value.text;
              onValue(textValue);

              textController.clear();
            }));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          onValue(value);
          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );
  }
}
