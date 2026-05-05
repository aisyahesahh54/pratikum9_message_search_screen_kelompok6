import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chat_model.dart';

class ApiService {
  // API lama (UTS)
  static const String urlCheck =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/check";

  // API baru (CHATS)
  static const String urlChats =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/chats";

  // ✅ FUNCTION LAMA (JANGAN DIHAPUS)
  static Future<String> fetchMessage() async {
    print("API CHECK DIPANGGIL");

    final response = await http.get(Uri.parse(urlCheck));

    if (response.statusCode == 200) {
      print("Response sukses: ${response.body}");
      return response.body;
    } else {
      print("Gagal: ${response.statusCode}");
      throw Exception("Gagal ambil data");
    }
  }

  // ✅ TAMBAHKAN INI (BIAR TIDAK MERAH)
  static Future<List<ChatModel>> fetchChats() async {
    try {
      print("API CHATS DIPANGGIL");

      final response = await http.get(Uri.parse(urlChats));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List list = data['data'];

        return list.map((e) => ChatModel.fromJson(e)).toList();
      } else {
        throw Exception("Gagal ambil chats");
      }
    } catch (e) {
      print("ERROR API, pakai MOCK");

      // fallback kalau error (misalnya CORS di Chrome)
      final List mock = [
        {"profile": "Ryan", "message": "Halo, lagi dimana?", "time": "10:30"},
        {"profile": "Adinda", "message": "Nanti meeting ya", "time": "11:00"},
      ];

      return mock.map((e) => ChatModel.fromJson(e)).toList();
    }
  }
}