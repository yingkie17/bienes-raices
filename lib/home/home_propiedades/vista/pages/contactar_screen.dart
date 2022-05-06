import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactoScreen extends StatefulWidget {
  @override
  State<ContactoScreen> createState() => _ContactoScreenState();
}

final nombreController = TextEditingController();
final celularController = TextEditingController();
final correoController = TextEditingController();
final asuntoController = TextEditingController();
final mensjaeController = TextEditingController();

Future enviarMensaje() async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_evv2yt4';
  const templateId = 'template_nufkq4g';
  const userId = 'o-ky0KfBvUk5OJj7p';
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': nombreController.text,
          'user_email': correoController,
          'user_subject': asuntoController,
          'user_phone': celularController,
          'user_message': mensjaeController
        }
      }));
  return response.statusCode;
}

class _ContactoScreenState extends State<ContactoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta acerca de nuestros servicios'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.account_circle),
                    hintText: 'Introducir Nombre',
                    labelText: 'Nombre',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: celularController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.add_ic_call),
                    hintText: 'Introducir Número de Celular',
                    labelText: 'Número de Celular',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: correoController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.alternate_email),
                    hintText: 'Introducir Correo Electrónico',
                    labelText: 'Correo Electrónico',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: asuntoController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.border_color_sharp),
                    hintText: 'Introducir Asunto',
                    labelText: 'Asunto',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: mensjaeController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.assignment_rounded),
                    hintText: 'Introducir Mensaje',
                    labelText: 'Mensaje',
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.indigo,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        'Consultar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      enviarMensaje();
                      //Navigator.pushNamed(context, 'Home');
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
