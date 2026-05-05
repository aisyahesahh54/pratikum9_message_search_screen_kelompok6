import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profile_model.dart';

class ApiService {
  static const String baseUrl =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/profile";

  static Future<ProfileModel> fetchProfile() async {
    final response = await http.get(Uri.parse(baseUrl));

    print("STATUS: ${response.statusCode}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProfileModel.fromJson(data['data']);
    } else {
      throw Exception("Gagal mengambil data profile");
    }
  }
}