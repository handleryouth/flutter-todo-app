import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/task.dart';

class ViewTaskScreen extends StatelessWidget {
  final Task task;

  const ViewTaskScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Edit Task")),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Task",
                      hintText: "Task",
                      border: OutlineInputBorder()),
                  initialValue: task.title,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: "Description",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 8,
                  initialValue: task.description,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ]))
        ]));
  }
}
