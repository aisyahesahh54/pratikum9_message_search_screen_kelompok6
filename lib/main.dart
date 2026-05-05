import 'package:flutter/material.dart';
import 'package:message_search_screen/views/profile_screen.dart';
import 'package:provider/provider.dart';
import 'viewmodels/profile_viewmodel.dart';
import 'views/profile_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
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
      home: const ProfileScreen(),
    );
  }
}