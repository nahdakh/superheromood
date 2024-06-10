import 'package:flutter/material.dart';
import 'MainScreen.dart';

void main() {
  runApp(SuperheroMoodApp());
}

class SuperheroMoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Superhero Mood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
