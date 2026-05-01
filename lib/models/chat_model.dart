class ChatModel {
  final String profile;
  final String message;
  final String time;

  ChatModel({
    required this.profile,
    required this.message,
    required this.time,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      profile: json['profile'] ?? '',
      message: json['message'] ?? '',
      time: json['time'] ?? '',
    );
  }
}