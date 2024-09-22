class ChatInputModel {
  final Map<String,dynamic> message;
  final String receiverId;
  final String messageId;

  ChatInputModel({required this.messageId,required this.message, required this.receiverId});

}
