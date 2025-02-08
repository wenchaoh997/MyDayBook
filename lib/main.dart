import 'package:flutter/material.dart';
import 'views/note_list_page.dart';

// 假设有一个简单的Note类
class Note {
  final String title;
  final String content;

  Note({
    required this.title,
    required this.content,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '笔记应用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteListPage(),
    );
  }
}
