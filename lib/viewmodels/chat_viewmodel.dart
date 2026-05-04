import 'package:flutter/material.dart';
import 'package:message_search_screen/models/chat_model.dart';
import 'package:message_search_screen/services/api_service.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatService _service = ChatService();

  List<ChatModel> chats = [];
  bool isLoading = false;

  Future<void> getChats() async {
    isLoading = true;
    notifyListeners();

    try {
      chats = await _service.fetchChats();
    } catch (e) {
      print("ERROR: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  void fetchChats() {}
}