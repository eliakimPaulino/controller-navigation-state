// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/task_widget.dart';

class TaskInheritedData extends InheritedWidget {
  TaskInheritedData({Key? key, required this.child})
      : super(key: key, child: child);

  final Widget child;

  final List<Task> taskList = [
    Task(
      dificulty: 4,
      img: 'assets/images/flutter_study.jpg',
      tarefa: 'My Flutter Study',
    ),
    Task(
      dificulty: 5,
      img: 'assets/images/eat_healthy.jpg',
      tarefa: 'Eat Healthy',
    ),
    // Task(
    //   dificulty: 3,
    //   img: 'assets/images/workout.jpg',
    //   tarefa: 'Workout',
    // ),
    Task(
      dificulty: 1,
      img: 'assets/images/drink.jpg',
      tarefa: 'Drink',
    ),
    Task(
      dificulty: 4,
      img: 'assets/images/date_girlfriend.jpg',
      tarefa: 'Date',
    ),
    // Task(
    //   tarefa: 'Play',
    //   img: 'assets/images/video_game.jpg',
    //   dificulty: 2,
    // ),
  ];

  void newTask(String name, String image, int difficulty) {
    taskList.add(Task(tarefa: name, img: image, dificulty: difficulty));
  }

  static TaskInheritedData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInheritedData>();
  }

  @override
  bool updateShouldNotify(TaskInheritedData oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
