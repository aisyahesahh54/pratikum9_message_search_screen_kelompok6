import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ChatViewModel extends ChangeNotifier {
  String message = "";
  bool isLoading = false;
   bool _isFetched = false; 

  Future<void> fetchChats() async {

    print("FETCH DIPANGGIL"); // 

    isLoading = true;
    notifyListeners();

    try {
      message = await ApiService.fetchMessage();

      print("DATA API: $message"); // 
    } catch (e) {
      message = "Error: $e";
      print("ERROR: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}