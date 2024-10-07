import 'package:flutter/material.dart';

void main() => runApp(const Entradasscreen());

class Entradasscreen extends StatelessWidget {
  const Entradasscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        appBar: AppBar(
          title: Text('La Cuna del Sabor'),
          backgroundColor: Color(0xFF7d1a49),
        ),
        body: const Center(
          child: Text('Entradas'),
        ),
      ),
    );
  }
}
