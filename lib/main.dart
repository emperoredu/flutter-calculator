import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' calculatort',
      theme: ThemeData(
        primaryColor: Colors.blue,
        backgroundColor: Colors.black26,
      ),
      home: const Homepage(title: ' Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}
