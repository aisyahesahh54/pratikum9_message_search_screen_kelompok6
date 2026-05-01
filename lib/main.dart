import 'package:flutter/material.dart';
import 'package:message_search_screen/screen/Audio%20Calling.dart';
import 'package:provider/provider.dart';

import 'viewmodels/chat_viewmodel.dart';

// IMPORT SCREEN
import 'screen/ChatsScreen.dart';
import 'screen/ContactsScreen.dart';
import 'screen/CallHistoryScreen.dart';
import 'screen/ProfileScreen.dart';
import 'screen/CallsSearchScreen.dart';
import 'screen/VideoVoiceCalling.dart';
import 'screen/MessageSearchScreen.dart';
import 'screen/EditProfileScreen.dart';
// ignore: unused_import
import 'screen/audio_calling.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App UI',
      theme: ThemeData(
        primaryColor: const Color(0xFF00BF6D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00BF6D),
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    ChatsScreen(),
    ContactsScreen(),
    CallHistoryScreen(),
    ProfileScreen(),
    AudioCallingScreen(),
    MessageSearchScreen(),
    CallsSearchScreen(),
    EditProfileScreen(),
    VideoCallingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF00BF6D),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Contacts"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Audio"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Msg"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Call"),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: "Video"),
        ],
      ),
    );
  }
}