// manage the state of tasks using the ChangeNotifier pattern
import 'package:flutter/foundation.dart';
import 'package:flutter_application_2/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks {
    return _tasks;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void checkTask(int index, bool value) {
    _tasks[index].isDone = value;
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void editTask(int index, Task taskValue) {
    _tasks[index] = taskValue;
    notifyListeners();
  }

  // Implement methods to update and delete tasks

  // You can also add methods for fetching and managing tasks
}
