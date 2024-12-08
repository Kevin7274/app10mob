import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Postresscreen extends StatelessWidget {
  const Postresscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Postres',
          style: TextStyle(
              color: Colors.white), // Cambia el color de la fuente a blanco
        ),
        backgroundColor: const Color(0xFFFFC107), // Color amarillo
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Regresar a la pantalla anterior
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color(0xFFFFF8E1), // Fondo amarillo claro
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('postres').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No hay postres disponibles.'));
            }

            final postres = snapshot.data!.docs;

            return ListView.builder(
              itemCount: postres.length,
              itemBuilder: (context, index) {
                final postre = postres[index];
                return _buildProductCard(
                  postre['nombre'], // Nombre del postre
                  postre['descripcion'], // Descripción del postre
                  postre['precio'], // Precio del postre (como número)
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(
      String productName, String productDescription, double price) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      color: const Color(0xFFFFE082), // Color amarillo para la tarjeta
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.cake,
                size: 50), // Icono de postre como marcador de posición
            const SizedBox(width: 16.0), // Espacio entre el ícono y el texto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7d1a49), // Color del texto
                    ),
                  ),
                  const SizedBox(
                      height: 8.0), // Espacio entre el nombre y la descripción
                  Text(
                    productDescription,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(
                      height: 8.0), // Espacio entre la descripción y el precio
                  Text(
                    '\$${price.toStringAsFixed(2)}', // Mostrar el precio
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
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