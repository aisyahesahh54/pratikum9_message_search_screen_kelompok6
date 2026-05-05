import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../services/api_service.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileModel? profile;
  bool isLoading = false;

  Future<void> getProfile() async {
    isLoading = true;
    notifyListeners();

    try {
      profile = await ApiService.fetchProfile();
    } catch (e) {
      print("ERROR: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}