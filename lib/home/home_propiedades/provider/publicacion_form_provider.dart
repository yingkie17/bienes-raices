import 'package:flutter/material.dart';
import 'package:bienes_raices_app/imports/imports.dart';

class PropiedadesPublicFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  PropiedadesPublic propiedadPublic;

  PropiedadesPublicFormProvider(this.propiedadPublic);

  bool isValidFormPropiedades() {
    return formKey.currentState?.validate() ?? false;
  }
}
