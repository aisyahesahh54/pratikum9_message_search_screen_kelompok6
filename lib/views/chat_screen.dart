import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/chat_view_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ChatViewModel>(context, listen: false).fetchChat());
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ChatViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey[200],

      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: vm.chats.length,
              itemBuilder: (context, index) {
                final chat = vm.chats[index];
                final isSender = chat.type == "sender";

                return Align(
                  alignment:
                      isSender ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: isSender
                          ? Colors.green[300]
                          : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15),
                        bottomLeft:
                            Radius.circular(isSender ? 15 : 0),
                        bottomRight:
                            Radius.circular(isSender ? 0 : 15),
                      ),
                    ),
                    child: Text(
                      chat.message,
                      style: TextStyle(
                        color: isSender ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}