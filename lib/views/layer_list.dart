import 'package:flutter/material.dart';
import '../models/note.dart';

class LayerList extends StatelessWidget {
  final List<Layer> layers;
  final String? selectedModule;
  final Function(String) onModuleSelected;

  const LayerList({
    super.key,
    required this.layers,
    required this.selectedModule,
    required this.onModuleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      bottom: 50,
      child: Container(
        width: 200,
        color: Colors.white,
        child: ListView(
          children: layers
              .map((layer) => ListTile(
                    title: Text('Module: ${layer.id}'),
                    selected: selectedModule == layer.id,
                    onTap: () => onModuleSelected(layer.id),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
