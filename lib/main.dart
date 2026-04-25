import 'package:flutter/material.dart';

// IMPORT SEMUA SCREEN
import 'screen/ChatsScreen.dart';
import 'screen/ContactsScreen.dart';
import 'screen/CallHistoryScreen.dart';
import 'screen/ProfileScreen.dart';
import 'screen/AudioCalling.dart';
import 'screen/CallsSearchScreen.dart';
import 'screen/ContactSearchScreen.dart';
import 'screen/MessageSearchScreen.dart';
import 'screen/EditProfileScreen.dart';
import 'screen/MessageScreen.dart';




void main() {
  runApp(const MyApp());
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

  // LIST SCREEN
  final List<Widget> _screens = const [
    ChatScreen(),
    ContactsScreen(),
    CallHistoryScreen(),
    ProfileScreen(),
    AudioCallingScreen(),
    MessageSearchScreen(),
    CallSearchScreen (),
    ContactsScreen(),
    EditProfileScreen(),
    ProfileScreen (),
    MessageScreen(),

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
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Calls",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Mesasage",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "ContactSearch",
             ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "MesageSearch",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "CallsSearch",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "editprofile",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "audioCalling",
             ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "vidiovoicecalling",
            
          ),
        ],
      ),
    );
  }
}

class EdiagesScreen {
  const EdiagesScreen();
}

class MessdeoCallingScreen {
  const MessdeoCallingScreen();
}

class ChatsScreen {
  const ChatsScreen();
}