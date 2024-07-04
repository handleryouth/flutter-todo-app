import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/edit_task_screen_model.dart';
import 'package:flutter_application_2/models/view_task_screen_model.dart';
import 'package:flutter_application_2/providers/task_provider.dart';
import 'package:flutter_application_2/screens/add_task_screen.dart';
import 'package:flutter_application_2/screens/edit_task_screen.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/view_task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   home: Scaffold(
    //     body: Center(
    //       child: Text('Hello World!'),
    //     ),
    //   ),
    // );

    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
          title: "Todo App",
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: "/",
          routes: {
            "/": (_) => const HomeScreen(),
            "/add-task": (_) => AddTaskScreen(),
            // Add more routes if needed
          }),
    );
  }
}
