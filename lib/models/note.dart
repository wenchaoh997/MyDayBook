import 'dart:ui';

class Note {
  final String title;
  final String content;

  Note({
    required this.title,
    required this.content,
  });
}

class Layer {
  final String id;
  final List<Offset> points; // 示例：用于存储绘图点

  Layer({required this.id, this.points = const []});
}
