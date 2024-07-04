import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final int index;
  final Function(bool?)? onChanged;
  final Function(int) onDeleted;
  final Function() onEdit;
  final Function() onView;

  const TaskTile(
      {super.key,
      required this.title,
      required this.isDone,
      required this.onChanged,
      required this.index,
      required this.onDeleted,
      required this.onView,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(title),
                trailing: IconButton(
                    //allows Flutter to potentially reuse the existing object instead of creating a new one
                    icon: const Icon(Icons.delete),
                    onPressed: () => onDeleted(index)),
                leading: Checkbox(
                  value: isDone,
                  onChanged: onChanged,
                )),
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: onEdit, child: const Text("View"))),
                Expanded(
                    child: TextButton(
                        onPressed: onEdit, child: const Text("Edit")))
              ],
            )
          ],
        ));
  }
}
