import 'package:flutter/material.dart';

class PageThumbnails extends StatelessWidget {
  final List<int> pages;
  final Function(int) onPageSelected;

  const PageThumbnails({
    super.key,
    required this.pages,
    required this.onPageSelected,
  });

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
