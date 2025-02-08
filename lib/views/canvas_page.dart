import 'package:flutter/material.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  CanvasPageState createState() => CanvasPageState();
}

class CanvasPageState extends State<CanvasPage> {
  // 当前选择的工具
  String selectedTool = 'brush';
  // 示例页面数据
  List<int> pages = List.generate(5, (index) => index + 1); // 假设有5页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建笔记'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CanvasArea(
            selectedTool: selectedTool,
          ),
          PageThumbnails(
            pages: pages,
            onPageSelected: (int pageIndex) {
              // 选择页面的逻辑
            },
          ),
          ToolBar(
            selectedTool: selectedTool,
            onToolSelected: (String tool) {
              setState(() {
                selectedTool = tool;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CanvasArea extends StatelessWidget {
  final String selectedTool;

  const CanvasArea({super.key, required this.selectedTool});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 595.0, // A4宽度（像素）
      height: 842.0, // A4高度（像素）
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
          // 根据选择的工具进行绘图或擦除
          if (selectedTool == 'brush') {
            // 添加绘图逻辑
          } else if (selectedTool == 'eraser') {
            // 添加擦除逻辑
          }
        },
        child: CustomPaint(
          size: Size(595.0, 842.0), // 确保CustomPaint的大小与A4一致
          painter: CanvasPainter(),
        ),
      ),
    );
  }
}

class PageThumbnails extends StatelessWidget {
  final List<int> pages;
  final Function(int) onPageSelected;

  const PageThumbnails(
      {super.key, required this.pages, required this.onPageSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onPageSelected(index),
            child: Container(
              width: 70.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Text(
                  'Page ${pages[index]}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ToolBar extends StatelessWidget {
  final String selectedTool;
  final Function(String) onToolSelected;

  const ToolBar(
      {super.key, required this.selectedTool, required this.onToolSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.brush),
            color: selectedTool == 'brush' ? Colors.blue : Colors.black,
            onPressed: () => onToolSelected('brush'),
          ),
          IconButton(
            icon: Icon(Icons.clear),
            color: selectedTool == 'eraser' ? Colors.blue : Colors.black,
            onPressed: () => onToolSelected('eraser'),
          ),
        ],
      ),
    );
  }
}

class CanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 在这里实现绘图逻辑
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
