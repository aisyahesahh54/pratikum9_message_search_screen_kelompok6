import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../services/api_service.dart';

class ChatViewModel extends ChangeNotifier {
  String message = "";
  bool isLoading = false;

  List<ChatModel> chats = [];

  Future<void> fetchChats() async {
    isLoading = true;
    notifyListeners();

    try {
      // ✅ API LAMA (UTS)
      message = await ApiService.fetchMessage();

      // ✅ API BARU (CHATS)
      chats = await ApiService.fetchChats();

      print("JUMLAH CHAT: ${chats.length}");
    } catch (e) {
      message = "Error: $e";
      print("ERROR: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}