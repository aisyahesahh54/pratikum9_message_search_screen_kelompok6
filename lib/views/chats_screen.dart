import 'package:flutter/material.dart';
import 'chats_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key, required String name});

  @override
  Widget build(BuildContext context) {
    // Data dummy (nanti bisa diganti API)
    final List<Map<String, String>> chats = [
      {"name": "Ryan", "message": "Halo, lagi dimana?", "time": "10:30"},
      {"name": "Adinda", "message": "Nanti kita meeting ya", "time": "11:00"},
      {"name": "Ainun", "message": "Jangan lupa bawa dokumen", "time": "12:15"},
      {"name": "Khairunnisa", "message": "Kapan kita makan siang?", "time": "13:45"},
      {"name": "Ambarwati", "message": "Besok ada acara apa?", "time": "14:20"},
      {"name": "Hida", "message": "Sudah selesai tugasnya?", "time": "15:10"},
      {"name": "Nabil", "message": "Kapan kita ngopi bareng?", "time": "16:00"},
      {"name": "Fariel", "message": "Jangan lupa deadline besok", "time": "17:30"},
      {"name": "Epi", "message": "Kapan kita jalan-jalan?", "time": "18:45"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        backgroundColor: Colors.green,
        centerTitle: false,
      ),

      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = chats[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(
                chat["name"]![0], // huruf pertama
                style: const TextStyle(color: Colors.black),
              ),
            ),

            title: Text(
              chat["name"]!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            subtitle: Text(chat["message"]!),

            trailing: Text(
              chat["time"]!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatsScreen(
                    name: chat["name"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}