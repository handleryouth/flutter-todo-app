import 'package:flutter_application_2/models/task.dart';

class EditTaskScreenModel {
  final Task task;
  final int index;

  EditTaskScreenModel({
    required this.index,
    required this.task,
  });
}
