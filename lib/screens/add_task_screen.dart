import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final desc = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: title, decoration: const InputDecoration(labelText: "Title")),
            TextField(controller: desc, decoration: const InputDecoration(labelText: "Description")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await ApiService.createTask(title.text, desc.text);
                Navigator.pop(context);
              },
              child: const Text("Create Task"),
            ),
          ],
        ),
      ),
    );
  }
}
