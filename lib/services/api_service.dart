import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profile_model.dart';

class ApiService {
  static const String url =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/profile";

  static Future<ProfileModel> getProfile() async {
    final response = await http.get(Uri.parse(url));

    print("STATUS API: ${response.statusCode}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProfileModel.fromJson(data['data']);
    } else {
      throw Exception("Gagal ambil data profile");
    }
  }
}