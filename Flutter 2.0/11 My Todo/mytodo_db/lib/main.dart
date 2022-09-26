import 'package:flutter/material.dart';
import 'screens/note_list.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: NoteList(),
    );
  }
}
