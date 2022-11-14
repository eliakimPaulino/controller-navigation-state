// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task_organizer_app/data/inherited_task_data.dart';
import 'package:task_organizer_app/screen/form_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        // leading: Icon(Icons.hide_source_rounded),
        title: const Center(
          child: Text(
            "TASK's",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: ListView(
        children: TaskInheritedData.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((contextNew) => FormScreen(taskContext: context)),
              ),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
