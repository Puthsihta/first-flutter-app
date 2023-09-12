import 'package:flutter/material.dart';
import './ramdomWord.dart';

//This function triggers the build process
void main() => runApp(MyApp());

// StatefulWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.green[400]),
        home: RamdomWord());
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
