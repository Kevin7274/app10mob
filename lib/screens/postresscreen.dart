import 'package:flutter/material.dart';

void main() => runApp(const Postresscreen());

class Postresscreen extends StatelessWidget {
  const Postresscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('La Cuna del Sabor'),
          backgroundColor: Color(0xFF7d1a49),
        ),
        body: const Center(
          child: Text('Postres'),
        ),
      ),
    );
  }
}
