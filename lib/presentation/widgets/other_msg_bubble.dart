import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/msg.dart';

class OtherMsgBubble extends StatelessWidget {
  final Message msg;
  const OtherMsgBubble({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: colors.primary, width: 1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              msg.text,
              style: TextStyle(color: colors.primary),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImgBubble(
          url: msg.imgURL,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImgBubble extends StatelessWidget {
  final String? url;
  const _ImgBubble({this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          url!,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Loading meme'),
            );
          },
        ));
  }
}
