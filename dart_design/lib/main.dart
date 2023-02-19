import 'package:flutter/material.dart';

import 'design/aboutUs.dart';
import 'design/shelter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "page design by Samina",
      home: SchoolWithData(),
    );
  }
}
