class ChatModel {
  final String message;

  ChatModel({required this.message});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      message: json['message'].toString(),
    );
  }
}