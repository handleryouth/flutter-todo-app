import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;

  const TaskCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            Text(description),
          ],
        ),
      ),
    );
  }
}
