import 'package:flutter/material.dart';
import 'package:sas_cfp/views/home_screen.dart'; // tela principal

void main() {
  runApp(const MyApp());
}

// Classe principal do app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinanCuca 💸',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple, // corzinha tema do app
      ),
      home: const HomeScreen(), // primeira tela a aparecer
    );
  }
}
