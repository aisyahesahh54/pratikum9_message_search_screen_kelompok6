import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:message_search_screen/models/chat_model.dart';

class ChatService {
  final String baseUrl =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/chats";

  Future<List<ChatModel>> fetchChats() async {
    final response = await http.get(Uri.parse(baseUrl));

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List chats = data['data'];

      return chats.map((e) => ChatModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal ambil data API");
    }
  }
}