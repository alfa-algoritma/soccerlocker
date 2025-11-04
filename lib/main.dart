import 'package:flutter/material.dart';
import 'package:soccerlocker/menu.dart'; // Impor file menu.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoccerLocker', // Judul aplikasi Anda
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Tema utama
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Langsung panggil MyHomePage dari menu.dart
      home: MyHomePage(),
    );
  }
}