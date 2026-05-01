import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chat_model.dart';

class ApiService {
  // 🔥 API TITLE
  static const String urlCheck =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/check";

  // 🔥 API CHAT LIST
  static const String urlChats =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/chats";

  // ===============================
  // 🔥 AMBIL TITLE (STRING)
  // ===============================
  static Future<String> fetchTitle() async {
    try {
      final response = await http.get(Uri.parse(urlCheck));

      print("TITLE STATUS: ${response.statusCode}");
      print("TITLE BODY: ${response.body}");

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Gagal ambil title: ${response.statusCode}");
      }
    } catch (e) {
      print("ERROR TITLE: $e");
      rethrow;
    }
  }

  // ===============================
  // 🔥 AMBIL CHAT (JSON)
  // ===============================
  static Future<List<ChatModel>> fetchChats() async {
    try {
      final response = await http.get(Uri.parse(urlChats));

      // 🔥 DEBUG WAJIB (biar kelihatan di console)
      print("CHAT STATUS: ${response.statusCode}");
      print("CHAT BODY: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // 🔥 DEBUG TAMBAHAN
        print("DATA TYPE: ${data.runtimeType}");

        // 🔥 HANDLE SEMUA FORMAT API
        if (data is List) {
          return data.map((e) => ChatModel.fromJson(e)).toList();
        } 
        else if (data is Map && data.containsKey('data')) {
          return (data['data'] as List)
              .map((e) => ChatModel.fromJson(e))
              .toList();
        } 
        else {
          throw Exception("Format API tidak dikenali");
        }

      } else {
        throw Exception("Gagal ambil chats: ${response.statusCode}");
      }
    } catch (e) {
      print("ERROR CHAT: $e");
      rethrow;
    }
  }
}