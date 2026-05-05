import 'package:http/http.dart' as http;

class ApiService {
  static const String url =
      "https://api.ppb.widiarrohman.my.id/api/2026/uts/B/kelompok6/check";

  static Future<String> fetchMessage() async {
    print("API DIPANGGIL"); // 👈 taruh di sini

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print("Response sukses: ${response.body}"); // opsional buat debug
      return response.body;
    } else {
      print("Gagal: ${response.statusCode}"); // opsional debug
      throw Exception("Gagal ambil data");
    }
  }
}