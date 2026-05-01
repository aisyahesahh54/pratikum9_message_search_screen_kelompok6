import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../services/api_service.dart';

class ChatViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<ChatModel> chats = [];
  bool isLoading = false;

  Future<void> fetchChats() async {
    isLoading = true;
    notifyListeners();

    try {
      chats = await _apiService.getChats();
    } catch (e) {
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }
}