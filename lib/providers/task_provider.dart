import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/api_service.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];
  bool loading = false;

  Future<void> loadTasks(String status) async {
    loading = true;
    notifyListeners();

    final data = await ApiService.getTaskList(status);
    tasks = data.map((e) => Task.fromJson(e)).toList();

    loading = false;
    notifyListeners();
  }
}
