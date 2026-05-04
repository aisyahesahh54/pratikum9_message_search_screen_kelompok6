class ChatModel {
  final String message;
  final String type;
  final String timestamp;

  ChatModel({
    required this.message,
    required this.type,
    required this.timestamp,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      message: json['message'] ?? '',
      type: json['type'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }
}