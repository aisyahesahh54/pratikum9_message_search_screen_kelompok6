class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final bool isActive;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    required this.isActive,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      name: json['name'],
      message: json['message'],
      time: json['time'],
      avatar: json['avatar'],
      isActive: json['isActive'],
    );
  }
}