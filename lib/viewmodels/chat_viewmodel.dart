import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../services/api_service.dart';

class ChatViewModel extends ChangeNotifier {
  List<ChatModel> _chats = [];
  bool _isLoading = false;

  String _title = ""; // 🔥 dari API /check

  List<ChatModel> get chats => _chats;
  bool get isLoading => _isLoading;
  String get title => _title;

  Future<void> loadChats() async {
    _isLoading = true;
    notifyListeners();

    try {
      // 🔥 ambil data dari 2 API
      _title = await ApiService.fetchTitle(); // /check
      _chats = await ApiService.fetchChats(); // /chats
    } catch (e) {
      debugPrint(e.toString());
    }

    _isLoading = false;
    notifyListeners();
  }
}