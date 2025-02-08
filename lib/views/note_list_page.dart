import 'package:flutter/material.dart';
import '../models/note.dart';
import 'canvas_page.dart';

class NoteListPage extends StatelessWidget {
  // 示例笔记数据
  final List<Note> notes = [
    Note(title: '笔记1', content: '这是笔记1的内容'),
    Note(title: '笔记2', content: '这是笔记2的内容'),
    Note(title: '笔记3', content: '这是笔记3的内容'),
  ];

  NoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('笔记列表'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            onTap: () {
              // 点击笔记时的处理逻辑
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CanvasPage()),
          );
        },
        label: Text('新建笔记'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
