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
    Future.microtask(() {
      Provider.of<ChatViewModel>(context, listen: false).fetchChats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        backgroundColor: Colors.green,
      ),

      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())

          : vm.chats.isEmpty
              ? const Center(child: Text("Tidak ada chat"))

              : ListView.builder(
                  itemCount: vm.chats.length,
                  itemBuilder: (context, index) {
                    final chat = vm.chats[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(
                          chat.profile.isNotEmpty
                              ? chat.profile[0]
                              : "?",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                      title: Text(
                        chat.profile,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(chat.message),

                      trailing: Text(
                        chat.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}