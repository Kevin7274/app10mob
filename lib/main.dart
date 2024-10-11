import 'package:cunadelsabor/screens/aboutscreen.dart';
import 'package:cunadelsabor/screens/bebidasscreen.dart';
import 'package:cunadelsabor/screens/contactoscreen.dart';
import 'package:cunadelsabor/screens/entradasscreen.dart';
import 'package:cunadelsabor/screens/termcondscreen.dart';
import 'package:flutter/material.dart';
import 'package:cunadelsabor/screens/platillosscreen.dart';
import 'package:cunadelsabor/screens/postresscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Cuna del Sabor',
      home: DefaultTabController(
        length: 2,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
        title: Text('La Cuna del Sabor'),
        backgroundColor: Color(0xFF7d1a49),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFFdecfea),
          child: ListView(
            children: [
              ListTile(
                title: Text('Entradas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Entradasscreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Platos fuertes'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Platillosscreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Postres'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Postresscreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Bebidas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bebidasscreen()),
                  );
                },
              ),
              Column(
                children: [
                  SizedBox(
                    height: 220,
                  ),
                  ListTile(
                    title: Text('Contacto'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Contactoscreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Acerca de'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Aboutscreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Terminos y condiciones'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Termcondscreen()),
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
        color: Color(0xFFf3f3f3),
        child: TabBarView(
          children: [
            Icon(Icons.home, color: Colors.black),
            Icon(Icons.person, color: Colors.black),
          ],
        ),
      ),
      bottomNavigationBar: TabBar(
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
