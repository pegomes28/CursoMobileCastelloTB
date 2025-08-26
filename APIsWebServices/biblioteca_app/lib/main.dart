import 'package:biblioteca_app/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Biblioteca",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color.fromARGB(255, 146, 97, 231),
      useMaterial3: true
    ),
    home: HomeView(),
  ));
  
}
