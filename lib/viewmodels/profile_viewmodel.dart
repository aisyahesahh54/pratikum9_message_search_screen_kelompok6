import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../services/api_service.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileModel? profile;
  bool isLoading = false;
  String status = "";

  String? get statusTest => null;

  Future<void> fetchProfile() async {
    isLoading = true;
    notifyListeners();

    try {
      profile = await ApiService.getProfile();
      status = "UTS Kelas B - Kelompok 6, test pakai API berhasil ✅";
    } catch (e) {
      status = "API gagal ❌";
    }

    isLoading = false;
    notifyListeners();
  }
}