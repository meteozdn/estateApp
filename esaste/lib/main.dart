import 'package:esaste/models/apartmentModel.dart';
import 'package:esaste/views/page1.dart';
import 'package:esaste/views/page2.dart';
import 'package:esaste/views/page3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Page1(),
      ),
    );
  }
}
