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
    final profileName = json['profile'] ?? '';

    return ChatModel(
      name: profileName,
      message: json['message'] ?? '',
      time: json['time'] ?? '',
      avatar: "https://i.pravatar.cc/150?u=$profileName",
      isActive: false,
    );
  }
}