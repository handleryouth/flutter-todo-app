/*
Defines data models, 
such as the Task class.
*/
class Task {
  final String id;
  final String title;
  final String description;
  bool isDone;

  Task(
      {required this.id,
      required this.title,
      required this.isDone,
      required this.description});
}
