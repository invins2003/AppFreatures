// import 'package:features/bottomsheet/draggableScrollableSheet1.dart';
import 'package:features/bottomsheet/draggableScrollableSheet2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Sheet(),
      home: Scaffold(
        body: Sheet2(child: SizedBox(height: 100,),),
      ),
    );
  }
}
