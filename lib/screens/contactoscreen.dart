import 'package:cunadelsabor/main.dart';
import 'package:flutter/material.dart';

class ContactosScreen extends StatefulWidget {
  @override
  Contactoscreen createState() => Contactoscreen();
}

class Contactoscreen extends State<ContactosScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _email = '';
  String _mensaje = '';

  @override
  Widget build(BuildContext context) {
    //quitar esto antes de empezar a hacer las rutas
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mensaje'),
                  maxLines: 4, // Permite múltiples líneas para el mensaje
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu mensaje';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _mensaje = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Procesar los datos
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Datos enviados:\nNombre: $_nombre\nEmail: $_email\nMensaje: $_mensaje')),
                      );
                    }
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
