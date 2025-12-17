import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;

  Future<bool> login(String email, String password) async {
    loading = true;
    notifyListeners();

    final result = await ApiService.login(email, password);

    loading = false;
    notifyListeners();
    return result;
  }
}
