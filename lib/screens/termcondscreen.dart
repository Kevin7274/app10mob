import 'package:cunadelsabor/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Termcondscreen());

class Termcondscreen extends StatelessWidget {
  const Termcondscreen({super.key});

  @override
  Widget build(BuildContext context) {
    //quitar esto antes de empezar a hacer las rutas
    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
    return MaterialApp(
      //quitar esto antes de empezar a hacer las rutas
      navigatorKey: _navigatorKey,
      title: '',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('La Cuna del Sabor'),
          backgroundColor: const Color(0xFF7d1a49),

          //quitar esto antes de empezar a hacer las rutas
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _navigatorKey.currentState!.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MyApp()),
                (Route<dynamic> route) => false,
              );
            },
          ),

          //quitar esto antes de empezar a hacer las rutas
        ),
        body: const Center(
          child: Text('Entradas'),
        ),
      ),
    );
  }
}
