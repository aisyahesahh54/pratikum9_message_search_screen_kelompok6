import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/chat_viewmodel.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatViewModel>(context, listen: false).fetchChats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ChatViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Chats",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            vm.isLoading
                ? const Text(
                    "Loading...",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  )
                : Text(
                    vm.message.isNotEmpty
                        ? vm.message
                        : "Tidak ada data",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
          ],
        ),
      ),

      // ✅ BODY SUDAH DIGABUNG DI SINI
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.chats.isEmpty
              ? const Center(child: Text("Data kosong"))
              : ListView.builder(
                  itemCount: vm.chats.length,
                  itemBuilder: (context, index) {
                    final chat = vm.chats[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(chat.avatar),
                      ),
                      title: Text(chat.name),
                      subtitle: Text(chat.message),
                      trailing: Text(chat.time),
                    );
                  },
                ),
    );
  }
}