import 'package:flutter/material.dart';

class Sheet extends StatefulWidget {
  const Sheet({super.key});

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Scrollable Sheet')),
      body: DraggableScrollableSheet(
        initialChildSize: 0.3, // starting height
        minChildSize: 0.2, // minimum height
        maxChildSize: 1.0, // maximum height
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            color: Colors.black,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text('Item $index',style: const TextStyle(color: Colors.white),),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
