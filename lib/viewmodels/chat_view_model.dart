import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatViewModel extends ChangeNotifier {
  List<ChatModel> chats = [];
  bool isLoading = false;
  String error = '';

  Future<void> fetchChat() async {
    isLoading = true;
    error = '';
    notifyListeners();

    try {
      final jsonString = '''
      {
        "status": "success",
        "message": "Chat detail fetched successfully",
        "data": [
          {"message": "Halo!", "type": "sender", "timestamp": "2026-04-28T10:00:00Z"},
          {"message": "Halo juga!", "type": "receiver", "timestamp": "2026-04-28T10:00:05Z"},
          {"message": "Lagi ngapain?", "type": "sender"},
          {"message": "Lagi santai nih, kamu?", "type": "receiver"},
          {"message": "Aku juga lagi santai, mau ngopi bareng?", "type": "sender"},
          {"message": "Boleh, kapan nih?", "type": "receiver"},
          {"message": "Besok sore gimana?", "type": "sender"},
          {"message": "Oke, besok sore kita ngopi bareng ya!", "type": "receiver"}
        ]
      }
      ''';

      final data = json.decode(jsonString);
      List listChat = data['data'];

      chats = listChat.map((e) => ChatModel.fromJson(e)).toList();
    } catch (e) {
      error = "Terjadi kesalahan";
    }

    isLoading = false;
    notifyListeners();
  }
}