import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chat_model.dart';

class ApiService {
  final String baseUrl = "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6";

  Future<List<ChatModel>> getChats() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/chats'), // ✅ FIX: pakai "chats"
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // ✅ Pastikan data adalah list
        final List<dynamic> chatsJson = data['data'];

        return chatsJson
            .map((json) => ChatModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load chats: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}