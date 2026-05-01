import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/chat_viewmodel.dart';

class MessageSearchScreen extends StatefulWidget {
  const MessageSearchScreen({super.key});

  @override
  State<MessageSearchScreen> createState() => _MessageSearchScreenState();
}

class _MessageSearchScreenState extends State<MessageSearchScreen> {

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
        title: const Text("Search Chats"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            color: const Color(0xFF00BF6D),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Search",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: vm.isLoading
                ? const Center(child: CircularProgressIndicator())
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
                        title: Text(chat.profile), // dari API
                        subtitle: Text(chat.message), // dari API
                        trailing: Text(chat.time), // dari API
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}