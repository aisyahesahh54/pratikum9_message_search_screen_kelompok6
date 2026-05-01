import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/chat_viewmodel.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatViewModel>().loadChats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatViewModel>();

    return Scaffold(
      // 🔥 SUDAH DISELIPKAN DI SINI
      appBar: AppBar(
        title: Text(
          vm.title.isNotEmpty
              ? vm.title // 🔥 dari API /check
              : "Loading...",
          style: const TextStyle(fontSize: 16),
        ),
        backgroundColor: const Color(0xFF00BF6D),
      ),

      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())

          : vm.chats.isEmpty
              ? const Center(child: Text("Tidak ada data"))

              : ListView.builder(
                  itemCount: vm.chats.length,
                  itemBuilder: (context, index) {
                    final chat = vm.chats[index];

                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://i.postimg.cc/g25VYN7X/user-1.png",
                        ),
                      ),

                      title: Text(
                        chat.message,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: const Text("UTS Kelompok 6"),
                      trailing: const Text("Now"),
                    );
                  },
                ),
    );
  }
}