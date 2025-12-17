import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_urls.dart';

class ApiService {
  static String token = "";

  // 🔐 LOGIN API
  static Future<bool> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiUrls.login),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    final data = jsonDecode(response.body);

    if (data["status"] == "success") {
      token = data["token"];
      return true;
    }
    return false;
  }

  // 📝 CREATE TASK
  static Future<void> createTask(
      String title, String description) async {
    await http.post(
      Uri.parse(ApiUrls.createTask),
      headers: {
        "Content-Type": "application/json",
        "token": token,
      },
      body: jsonEncode({
        "title": title,
        "description": description,
        "status": "New",
      }),
    );
  }

  // 📋 GET TASK LIST
  static Future<List> getTaskList(String status) async {
    final response = await http.get(
      Uri.parse("${ApiUrls.listTask}/$status"),
      headers: {"token": token},
    );

    final data = jsonDecode(response.body);
    return data["data"];
  }
}
