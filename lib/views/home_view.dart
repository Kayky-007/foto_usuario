import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:foto_usuario/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            controller.imagem != null
                ? Image.file(
                    File(controller.imagem!.path), 
                    width: 200,
                    height: 300,
                  )
                : Image.network(
                    'https://t4.ftcdn.net/jpg/02/17/88/73/360_F_217887350_mDfLv2ootQNeffWXT57VQr8OX7IvZKvB.jpg',
                    width: 200,
                    height: 300,
                  ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await controller.obterImagem();
                setState(() {}); 
              },
              child: const Text("Selecionar imagem"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.verificadorImagem(); 
              },
              child: const Text("Salvar imagem"),
            ),
          ],
        ),
      ],
    );
  }
}
