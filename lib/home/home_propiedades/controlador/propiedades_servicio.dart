import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PropiedadesServicio extends ChangeNotifier {
  final String _baseUrl =
      'flutter-bienes-raices-a3e64-default-rtdb.firebaseio.com';

  final List<PropiedadesPublic> propiedadesPublic = [];
  late PropiedadesPublic selectedProduct;
  bool isLoading = true;

  PropiedadesServicio() {
    this.loadPropiedades();
  }

  Future<List<PropiedadesPublic>> loadPropiedades() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'bienes_racies/propiedad.json');
    final response = await http.get(url);
    //La respuesta que vamos a recibir es de tipo mapa en el body
    // Es necesario introducirlo en un Map
    final Map<String, dynamic> propiedadesMap = json.decode(response.body);

    propiedadesMap.forEach((key, value) {
      final propiedadTemporal = PropiedadesPublic.fromMap(value);
      propiedadTemporal.idpropiedad = key;
      this.propiedadesPublic.add(propiedadTemporal);
    });

    // Cuando termine la carga ya podemos poner el isLoading en fasle y notificarlo
    this.isLoading = false;
    notifyListeners();
    return this.propiedadesPublic;
  }
}
