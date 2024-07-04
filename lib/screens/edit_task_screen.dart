import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/task.dart';
import 'package:flutter_application_2/providers/task_provider.dart';
import 'package:provider/provider.dart';

class EditTaskScreen extends StatefulWidget {
  final Task taskValue;
  final int index;

  const EditTaskScreen(
      {super.key, required this.index, required this.taskValue});

  @override
  State<StatefulWidget> createState() {
    return EditTaskState();
  }
}

class EditTaskState extends State<EditTaskScreen> {
  late TextEditingController _taskController;
  late TextEditingController _descriptionController;

  final _formKey = GlobalKey<FormState>();

  void _editTask(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var taskProvider = Provider.of<TaskProvider>(context, listen: false);
      Task newValue = Task(
          id: widget.taskValue.id,
          title: _taskController.text,
          isDone: false,
          description: _descriptionController.text);

      taskProvider.editTask(widget.index, newValue);

      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.taskValue.title);
    _descriptionController =
        TextEditingController(text: widget.taskValue.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Edit Task")),
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
                              onPressed: () => _editTask(context),
                              child: const Text("Save")),
                        )
                      ],
                    )))
          ],
        ));
  }
}



// class EditTaskScreen extends StatelessWidget {
//   EditTaskScreen({
//     super.key,
//     required this.taskEditedValue,
//   }) {
//     _taskController.fromValue(TextEditingValue(text: "initial value"));
//     _taskController.value = taskEditedValue.title as TextEditingValue;
//     _descriptionController.value =
//         taskEditedValue.description as TextEditingValue;
//   }

//   final Task taskEditedValue;

//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController _taskController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

// /*
// Rebuilt Every Time: Functions inside the build method are recreated every time the build method is called. 
// This can happen frequently, for example, when the state of the widget changes.

// */
//   void _editTask(BuildContext cotext) {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text("Edit Task")),
//         body: Column(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Form(
//                     key: _formKey,
//                     child: Wrap(
//                       //How much space to place between children in a run in the main axis.
//                       // spacing: 20,
//                       //How much space to place between the runs themselves in the cross axis.
//                       runSpacing: 20,
//                       children: <Widget>[
//                         TextFormField(
//                           // The validator receives the text that the user has entered.
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter some text';
//                             }
//                             return null;
//                           },

//                           controller: _taskController,
//                           decoration: const InputDecoration(
//                               labelText: "Task",
//                               hintText: "Task",
//                               border: OutlineInputBorder()),
//                         ),
//                         TextFormField(
//                           decoration: const InputDecoration(
//                             labelText: "Description",
//                             hintText: "Description",
//                             border: OutlineInputBorder(),
//                           ),
//                           maxLines: 8,
//                           controller: _descriptionController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter some text';
//                             }
//                             return null;
//                           },
//                         ),
//                         Center(
//                           child: ElevatedButton(
//                               onPressed: () => _editTask(context),
//                               child: const Text("Save")),
//                         )
//                       ],
//                     )))
//           ],
//         ));
//   }
// }
