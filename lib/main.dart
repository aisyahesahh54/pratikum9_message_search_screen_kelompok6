import 'package:flutter/material.dart';
import 'package:message_search_screen/viewmodels/chat_viewmodel.dart';
import 'package:message_search_screen/views/chatsScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatsScreen(),
    );
  }
}