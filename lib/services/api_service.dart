import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chat_model.dart';

class ApiService {
  final String url =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/chats";

  Future<List<ChatModel>> getChats() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List list = data['data'];

      return list.map((e) => ChatModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal ambil data API");
    }
  }
}