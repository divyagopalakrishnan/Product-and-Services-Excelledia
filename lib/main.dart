
import 'package:excelledia_project/productandservice_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Project',
      darkTheme: ThemeData.dark(),
      home:  const ProductAndServiceScreen(),
    );
  }
}