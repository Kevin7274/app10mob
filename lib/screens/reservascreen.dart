import 'package:cunadelsabor/main.dart';
import 'package:flutter/material.dart';

class ReservasScreen extends StatefulWidget {
  @override
  Reservascreen createState() => Reservascreen();
}

class Reservascreen extends State<ReservasScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _telefono = '';
  DateTime? _fechaReserva;
  TimeOfDay? _horaReserva;
  int _numeroPersonas = 1;
  String _metodoPago = 'Efectivo';
  bool _terminosAceptados = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
    return MaterialApp(
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              navigatorKey.currentState!.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MyApp()),
                (Route<dynamic> route) => false,
              );
            },
          ),
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
                  decoration: InputDecoration(labelText: 'Número de Teléfono'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa tu número de teléfono';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _telefono = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Fecha de Reserva',
                    hintText: _fechaReserva != null
                        ? '${_fechaReserva!.day}/${_fechaReserva!.month}/${_fechaReserva!.year}'
                        : 'Selecciona una fecha',
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _fechaReserva ?? DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _fechaReserva = pickedDate;
                      });
                    }
                  },
                  validator: (value) {
                    if (_fechaReserva == null) {
                      return 'Selecciona una fecha de reserva';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Hora de Reserva',
                    hintText: _horaReserva != null
                        ? '${_horaReserva!.hour}:${_horaReserva!.minute}'
                        : 'Selecciona una hora',
                  ),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: _horaReserva ?? TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _horaReserva = pickedTime;
                      });
                    }
                  },
                  validator: (value) {
                    if (_horaReserva == null) {
                      return 'Selecciona una hora de reserva';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Número de Personas'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa el número de personas';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _numeroPersonas = int.tryParse(value) ?? 1;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _metodoPago,
                  decoration: InputDecoration(labelText: 'Método de Pago'),
                  items: const [
                    DropdownMenuItem(
                      child: Text('Efectivo'),
                      value: 'Efectivo',
                    ),
                    DropdownMenuItem(
                      child: Text('Tarjeta de Crédito'),
                      value: 'Tarjeta de Crédito',
                    ),
                    DropdownMenuItem(
                      child: Text('PayPal'),
                      value: 'PayPal',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _metodoPago = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Selecciona un método de pago';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _terminosAceptados,
                      onChanged: (value) {
                        setState(() {
                          _terminosAceptados = value!;
                        });
                      },
                    ),
                    const Text('Acepto los términos y condiciones'),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _terminosAceptados) {
                      // Procesar los datos
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Datos enviados:\nNombre: $_nombre\nTeléfono: $_telefono\nFecha de Reserva: ${_fechaReserva!.day}/${_fechaReserva!.month}/${_fechaReserva!.year}\nHora de Reserva: ${_horaReserva!.hour}:${_horaReserva!.minute}\nNúmero de Personas: $_numeroPersonas\nMétodo de Pago: $_metodoPago')),
                      );
                    } else if (!_terminosAceptados) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Debes aceptar los términos y condiciones')),
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
