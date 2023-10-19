import 'package:appirora/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.indigo[900],
          secondary: Colors.orange[300],
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      ),
      home: HomeScreen(),
    );
  }
}
