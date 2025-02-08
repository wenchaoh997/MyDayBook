import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  final String selectedTool;
  final Function(String) onToolSelected;
  final VoidCallback onToggleThumbnails;
  final bool isThumbnailsVisible;
  final VoidCallback onToggleLayerList;
  final bool isLayerListVisible;

  const ToolBar({
    super.key,
    required this.selectedTool,
    required this.onToolSelected,
    required this.onToggleThumbnails,
    required this.isThumbnailsVisible,
    required this.onToggleLayerList,
    required this.isLayerListVisible,
  });

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
          IconButton(
            icon: Icon(
                isThumbnailsVisible ? Icons.visibility_off : Icons.visibility),
            onPressed: onToggleThumbnails,
          ),
          IconButton(
            icon: Icon(isLayerListVisible ? Icons.layers : Icons.layers_clear),
            onPressed: onToggleLayerList,
          ),
        ],
      ),
    );
  }
}
