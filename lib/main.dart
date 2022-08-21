import 'package:flutter/material.dart';
import 'package:todolist_app/home.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/providers/todo_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoPrivder(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TodoList App",
        home: HomeScreen(),
      ),
    );
  }
}
