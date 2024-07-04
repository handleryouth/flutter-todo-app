import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/task.dart';
import 'package:flutter_application_2/providers/task_provider.dart';
import 'package:flutter_application_2/screens/edit_task_screen.dart';
import 'package:flutter_application_2/screens/view_task_screen.dart';
import 'package:flutter_application_2/widgets/task_tile.dart';
import 'package:provider/provider.dart';

/*
Widget Identity: Keys are important in Flutter for preserving the state of widgets when they move around in the widget tree. 
By passing a key, you ensure that the framework can correctly identify and manage the widget's state.

*/

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Future<void> _dialogBuilder(BuildContext context) {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Basic dialog title'),
  //         content: const Text(
  //           'A dialog is a type of modal window that\n'
  //           'appears in front of app content to\n'
  //           'provide critical information, or prompt\n'
  //           'for a decision to be made.',
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               textStyle: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             child: const Text('Disable'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               textStyle: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             child: const Text('Enable'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final taskContext = Provider.of<TaskProvider>(context);
    final tasks = taskContext.tasks;

    void onEdit(Task editedValue, int index) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditTaskScreen(
            taskValue: editedValue,
            index: index,
          ),
        ),
      );
    }

    void onView(Task task) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewTaskScreen(
            task: task,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        // Implement the form to add a task here
      ),
      // body: tasks.isNotEmpty
      //     ? ListView.builder(
      //         itemCount: tasks.length,
      //         itemBuilder: (ctx, index) {
      //           var task = tasks[index];
      //           return TaskTile(
      //               title: task.title,
      //               index: index,
      //               isDone: task.isDone,
      //               onDeleted: (index) {
      //                 taskContext.deleteTask(index);
      //               },
      //               onChanged: (value) {
      //                 if (value != null) {
      //                   taskContext.checkTask(index, value);
      //                   // Implement task completion logic
      //                 }
      //               });
      //         },
      //       )
      //     : const Center(
      //         child: Text("Empty To Do List!"),
      //       ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          var task = tasks[index];
          return TaskTile(
              title: task.title,
              index: index,
              isDone: task.isDone,
              onView: () {
                onView(task);
              },
              onDeleted: (index) {
                taskContext.deleteTask(index);
              },
              onEdit: () => {onEdit(task, index)},
              onChanged: (value) {
                if (value != null) {
                  taskContext.checkTask(index, value);
                  // Implement task completion logic
                }
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(("/add-task"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
