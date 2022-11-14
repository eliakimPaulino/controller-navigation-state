// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task_organizer_app/data/inherited_task_data.dart';
import 'package:task_organizer_app/screen/main_screen.dart';

// import 'screen/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff3f5f7),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(
                secondary: Colors.lightBlueAccent, tertiary: Colors.blueGrey),
      ),
      home: TaskInheritedData(child: const MainScreen()),
    );
  }
}
