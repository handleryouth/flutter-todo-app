import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/task.dart';
import 'package:flutter_application_2/providers/task_provider.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.

  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _addTask(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      String title = _taskController.text;
      String description = _descriptionController.text;

      Provider.of<TaskProvider>(context, listen: false).addTask(Task(
          id: DateTime.now().toString(),
          title: title,
          description: description,
          isDone: false));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Task")),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Wrap(
                      //How much space to place between children in a run in the main axis.
                      // spacing: 20,
                      //How much space to place between the runs themselves in the cross axis.
                      runSpacing: 20,
                      children: <Widget>[
                        TextFormField(
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _taskController,
                          decoration: const InputDecoration(
                              labelText: "Task",
                              hintText: "Task",
                              border: OutlineInputBorder()),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Description",
                            hintText: "Description",
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 8,
                          controller: _descriptionController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Center(
                          child: ElevatedButton(
                              onPressed: () => _addTask(context),
                              child: const Text("Add Task")),
                        )
                      ],
                    ))),
          ],
        ));
  }
}
