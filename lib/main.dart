import 'package:flutter/material.dart';
import 'package:foto_usuario/views/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Câmera e Salvamento de Foto'),
        ),
        body: const Center(
          child: HomeView()
        ),
      ),
    );
  }
}