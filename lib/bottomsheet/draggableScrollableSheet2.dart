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

  // Define max and min sizes here
  final double maxChildSize = 0.95;
  final double minChildSize = 0.0;
  final double initialChildSize = 0.5;
  final List<double> snapSizes = [];

  @override
  void initState() {
    super.initState();
    controller.addListener(onChanged);
  }

  void onChanged() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(snapSizes.first);
  void anchor() => animateSheet(snapSizes.last);
  void expand() => animateSheet(maxChildSize);
  void hide() => animateSheet(minChildSize);

  void animateSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(milliseconds: 300), // Smoother animation
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Calculate snapSizes based on constraints
      snapSizes.clear();
      snapSizes.add(60 / constraints.maxHeight); // Custom snap size
      snapSizes.add(initialChildSize); // Snap size at 0.5

      return DraggableScrollableSheet(
        key: sheet,
        controller: controller,
        initialChildSize: initialChildSize,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
        expand: true,
        snap: true,
        snapSizes: snapSizes, // Snap sizes added here

        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
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
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      _buildHeader(), // Dummy header UI
                      const SizedBox(height: 16),
                      _buildContent(), // Dummy content UI
                      const SizedBox(height: 16),
                      _buildButtons(), // Dummy buttons UI
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Bottom Sheet Title',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: hide, // Hides the bottom sheet
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'This is a dummy description for the bottom sheet UI. '
            'It can contain multiple lines of text, images, or any other widgets you want to display.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Additional details or widgets can be placed here.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              // Action for the button
            },
            child: const Text('Confirm'),
          ),
          OutlinedButton(
            onPressed: () {
              // Action for the button
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
