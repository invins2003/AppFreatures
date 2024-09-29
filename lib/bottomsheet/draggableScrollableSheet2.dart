 import 'package:flutter/material.dart';

class Sheet2 extends StatefulWidget {
  final Widget child;
  const Sheet2({super.key, required this.child});

  @override
  State<Sheet2> createState() => _Sheet2State();
}

class _Sheet2State extends State<Sheet2> {

final sheet = GlobalKey();
final controller = DraggableScrollableController();

  @override
Widget build(BuildContext context) {
  return LayoutBuilder(builder: (context, constraints) {
    return DraggableScrollableSheet(
      key: sheet,
      initialChildSize: 0.5,
      maxChildSize: 0.95,
      minChildSize: 0,
      expand: true,
      snap: true,
      snapSizes: [
        60/ constraints.maxHeight
      ],

      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: const  BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.yellow,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
            ),
          ),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: widget.child, // Replace with your actual widget
              ),
            ],
          ),
        );
      },
    );
  });
}
}