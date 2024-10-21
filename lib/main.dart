import 'package:cunadelsabor/screens/aboutscreen.dart';
import 'package:cunadelsabor/screens/bebidasscreen.dart';
import 'package:cunadelsabor/screens/contactoscreen.dart';
import 'package:cunadelsabor/screens/entradasscreen.dart';
import 'package:cunadelsabor/screens/reservascreen.dart';
import 'package:cunadelsabor/screens/termcondscreen.dart';
import 'package:flutter/material.dart';
import 'package:cunadelsabor/screens/platillosscreen.dart';
import 'package:cunadelsabor/screens/postresscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Cuna del Sabor',
      home: DefaultTabController(
        length: 2,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'ComidApp',
          style: TextStyle(
              color: Colors.white), // Cambia el color de la fuente a blanco
        ),
        backgroundColor: const Color(0xFF7d1a49),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFFdecfea),
          child: ListView(
            children: [
              ListTile(
                title: const Text('Entradas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Entradasscreen()),
                  );
                },
              ),
              ListTile(
                title: const Text('Platos fuertes'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Platillosscreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Postres'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Postresscreen()),
                  );
                },
              ),
              ListTile(
                title: const Text('Bebidas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Bebidasscreen()),
                  );
                },
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 220,
                  ),
                  ListTile(
                    title: const Text('Reservas'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReservasScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Contacto'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactosScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Acerca de'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Aboutscreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Terminos y condiciones'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Termcondscreen()),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFf3f3f3),
        child: TabBarView(
          children: [
            Image.asset('assets/comida1.jpg'),
            const Icon(Icons.home, color: Colors.black),
            const Icon(Icons.person, color: Colors.black),
          ],
        ),
      ),
      bottomNavigationBar: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home, color: Colors.black)),
          Tab(icon: Icon(Icons.person, color: Colors.black)),
        ],
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.black,
      ),
    );
  }
}
