import 'package:flutter/material.dart';
import 'package:message_search_screen/viewmodels/profile_viewmodel.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}