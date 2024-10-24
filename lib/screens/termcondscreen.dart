import 'package:cunadelsabor/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Termcondscreen());

class Termcondscreen extends StatelessWidget {
  const Termcondscreen({super.key});

  @override
  Widget build(BuildContext context) {
    //quitar esto antes de empezar a hacer las rutas
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //quitar esto antes de empezar a hacer las rutas
      navigatorKey: navigatorKey,
      title: '',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'ComidApp',
            style: TextStyle(
                color: Colors.white), // Cambia el color de la fuente a blanco
          ),
          backgroundColor: const Color(0xFF7d1a49),

          //quitar esto antes de empezar a hacer las rutas
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              navigatorKey.currentState!.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MyApp()),
                (Route<dynamic> route) => false,
              );
            },
          ),

          //quitar esto antes de empezar a hacer las rutas
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Términos y Condiciones',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Espacio entre el título y el texto
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur feugiat lectus in mi facilisis pretium. Vestibulum dapibus, dolor id aliquet condimentum, dui massa fringilla turpis, quis blandit sapien sem at ligula. Vestibulum pellentesque velit nulla, in egestas leo semper vitae. Phasellus ut lacus et dolor viverra lobortis. Donec vehicula metus ut arcu accumsan suscipit. In orci eros, placerat at suscipit eget, commodo eu quam. Cras tincidunt tempus orci, et finibus lacus tempus sit amet. Fusce massa nulla, tempus eu bibendum ac, bibendum eu lorem. Etiam ultricies tortor posuere, rhoncus nibh nec, dictum turpis. Vivamus ultrices facilisis libero eget rutrum. Suspendisse a venenatis quam.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
