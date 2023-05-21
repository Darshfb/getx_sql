import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/config/task_bindings.dart';
import 'package:getx_sqflite/view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TasksBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      initialBinding: TasksBindings(),
      home: HomeScreen(),
    );
  }
}
