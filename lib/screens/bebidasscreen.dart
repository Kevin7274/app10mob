import 'package:cunadelsabor/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Bebidasscreen());

class Bebidasscreen extends StatelessWidget {
  const Bebidasscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
    //quitar esto antes de empezar a hacer las rutas
    return MaterialApp(
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
                MaterialPageRoute(builder: (context) => MyApp()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          //quitar esto antes de empezar a hacer las rutas
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            _buildProductCard(
              'assets/drinks2.jpg', // URL de la imagen del producto
              'jugo',
              'Descripción corta del producto 1.',
            ),
            _buildProductCard(
              'assets/drinks1.jpg',
              'Vino',
              'Descripción corta del producto 2.',
            ),
            _buildProductCard(
              'assets/drinks3.jpg',
              'Nombre del Producto 3',
              'Descripción corta del producto 3.',
            ),
            // Añade más productos aquí...
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      String imageUrl, String productName, String productDescription) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: 50, // Ancho de la imagen
              height: 50, // Alto de la imagen
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0), // Espacio entre la imagen y el texto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 8.0), // Espacio entre el nombre y la descripción
                  Text(
                    productDescription,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
