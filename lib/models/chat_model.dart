class ChatModel {
  final String message;
  final MessageFrom messageFrom;

  ChatModel({
    required this.message,
    required this.messageFrom,
  });
}

enum MessageFrom { me, bot }
