import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/chat_viewmodel.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {

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
        title: const Text("People"),
        backgroundColor: const Color(0xFF00BF6D),
        foregroundColor: Colors.white,
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
                        chat.profile, // dari API
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                      subtitle: Text(
                        chat.message, // dari API
                      ),

                      trailing: Text(
                        chat.time, // dari API
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                ),
    );
  }
}