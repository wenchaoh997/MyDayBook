import 'package:flutter/material.dart';
import '../models/note.dart';
import 'canvas_area.dart';
import 'tool_bar.dart';
import 'page_thumbnails.dart';
import 'layer_list.dart';

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
  // 控制页面缩略图的可见性
  bool isThumbnailsVisible = false;
  // TransformationController用于控制缩放和平移
  final TransformationController _transformationController =
      TransformationController();
  // 缩放比例
  double _currentScale = 1.0;
  // 每页的图层列表
  Map<int, List<Layer>> pageLayers = {};
  // 控制图层列表的可见性
  bool isLayerListVisible = false;
  // 当前选中的模块
  String? selectedModule;

  @override
  void initState() {
    super.initState();
    _transformationController.addListener(_onScaleChanged);
    // 初始化每页的图层
    for (var page in pages) {
      pageLayers[page] = [Layer(id: 'layer1'), Layer(id: 'layer2')]; // 每页初始一个图层
    }
  }

  @override
  void dispose() {
    _transformationController.removeListener(_onScaleChanged);
    _transformationController.dispose();
    super.dispose();
  }

  void _onScaleChanged() {
    setState(() {
      _currentScale = _transformationController.value.getMaxScaleOnAxis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建笔记'),
      ),
      body: Stack(
        children: [
          // 画布区域
          Positioned.fill(
            child: InteractiveViewer(
              transformationController: _transformationController,
              panEnabled: true, // 允许平移
              scaleEnabled: true, // 允许缩放
              minScale: 0.5, // 最小缩放比例
              maxScale: 3.5, // 最大缩放比例
              child: CanvasArea(
                selectedTool: selectedTool,
                layers: isLayerListVisible
                    ? pageLayers[pages.first]!
                    : [], // 根据可见性显示图层
              ),
            ),
          ),
          // 缩放比例显示
          Positioned(
            top: 16.0,
            left: 16.0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                '缩放: ${(_currentScale * 100).toStringAsFixed(0)}%',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // 页面缩略图和工具栏
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: isThumbnailsVisible ? 100.0 : 0.0,
                child: Visibility(
                  visible: isThumbnailsVisible,
                  child: PageThumbnails(
                    pages: pages,
                    onPageSelected: (int pageIndex) {
                      // 选择页面的逻辑
                    },
                  ),
                ),
              ),
              ToolBar(
                selectedTool: selectedTool,
                onToolSelected: (String tool) {
                  setState(() {
                    selectedTool = tool;
                  });
                },
                onToggleThumbnails: () {
                  setState(() {
                    isThumbnailsVisible = !isThumbnailsVisible;
                  });
                },
                isThumbnailsVisible: isThumbnailsVisible,
                onToggleLayerList: () {
                  setState(() {
                    isLayerListVisible = !isLayerListVisible;
                  });
                },
                isLayerListVisible: isLayerListVisible,
              ),
            ],
          ),
          if (isLayerListVisible)
            LayerList(
              layers: pageLayers[pages.first]!,
              selectedModule: selectedModule,
              onModuleSelected: (String moduleId) {
                setState(() {
                  selectedModule = moduleId;
                });
              },
            ),
        ],
      ),
    );
  }
}
