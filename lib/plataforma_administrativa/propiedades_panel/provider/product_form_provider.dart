import 'dart:ffi';

import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Propiedades propiedad;

  ProductFormProvider(this.propiedad);
  updateEstadoPropiedad(bool value) {
    print(value);
    this.propiedad.estadoPropiedad = value;
    notifyListeners();
  }

  updateExclusividad(bool value) {
    print(value);
    this.propiedad.exclusividadPropiedad = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(propiedad.tipoPropiedad);
    print(propiedad.estadoPropiedad);
    print(propiedad.precioPropiedad);
    return formKey.currentState?.validate() ?? false;
  }
}
