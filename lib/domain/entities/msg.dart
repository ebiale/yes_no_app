enum MsgOrigin { me, other }

class Message {
  final String text;
  final String? imgURL;
  final MsgOrigin msgOrigin;

  Message({required this.text, this.imgURL, required this.msgOrigin});
}
