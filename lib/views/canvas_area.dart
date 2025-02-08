import 'package:flutter/material.dart';
import '../models/note.dart';

class CanvasArea extends StatelessWidget {
  final String selectedTool;
  final List<Layer> layers;

  const CanvasArea(
      {super.key, required this.selectedTool, required this.layers});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 595.0,
      height: 842.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        onPanUpdate: (details) {
          if (selectedTool == 'brush') {
            // 添加绘图逻辑
          } else if (selectedTool == 'eraser') {
            // 添加擦除逻辑
          }
        },
        child: CustomPaint(
          size: Size(595.0, 842.0),
          painter: CanvasPainter(layers: layers),
        ),
      ),
    );
  }
}

class CanvasPainter extends CustomPainter {
  final List<Layer> layers;

  CanvasPainter({required this.layers});

  @override
  void paint(Canvas canvas, Size size) {
    for (var layer in layers) {
      for (var point in layer.points) {
        canvas.drawCircle(point, 2.0, Paint()..color = Colors.black);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
