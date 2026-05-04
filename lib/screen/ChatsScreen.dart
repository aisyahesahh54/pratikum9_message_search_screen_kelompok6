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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00BF6D),
        title: const Text("Chats"),
      ),

      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.chats.isEmpty
              ? const Center(child: Text("Tidak ada chat"))
              : ListView.builder(
                  itemCount: vm.chats.length,
                  itemBuilder: (context, index) {
                    final chat = vm.chats[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Text(
                              chat.profile.isNotEmpty
                                  ? chat.profile[0]
                                  : "?",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.profile,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  chat.message,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),

                          Text(
                            chat.time,
                            style: const TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}