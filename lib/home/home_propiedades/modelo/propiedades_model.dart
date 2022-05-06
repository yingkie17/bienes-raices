// To parse this JSON data, do
//
//     final propiedades = propiedadesFromMap(jsonString);

import 'dart:convert';

class PropiedadesPublic {
  PropiedadesPublic({
    this.idpropiedad,
    this.cantidadBanosPropiedad,
    this.cantidadHabitacionesPropiedad,
    this.ciudadPropiedad,
    this.comisionPropiedad,
    required this.descripcionPropiedad,
    required this.estadoPropiedad,
    required this.exclusividadPropiedad,
    required this.fechaPropiedad,
    this.foto1,
    this.garajePropiedad,
    required this.modalidadPropiedad,
    this.precioPropiedad,
    this.restriccionesPropiedad,
    required this.tipoPropiedad,
    this.ubicacionPropiedad,
  });
  String? idpropiedad;
  int? cantidadBanosPropiedad;
  int? cantidadHabitacionesPropiedad;
  String? ciudadPropiedad;
  double? comisionPropiedad;
  String descripcionPropiedad;
  bool estadoPropiedad;
  bool exclusividadPropiedad;
  String fechaPropiedad;
  String? foto1;
  bool? garajePropiedad;
  String modalidadPropiedad;
  double? precioPropiedad;
  String? restriccionesPropiedad;
  String tipoPropiedad;
  String? ubicacionPropiedad;

  factory PropiedadesPublic.fromJson(String str) =>
      PropiedadesPublic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PropiedadesPublic.fromMap(Map<String, dynamic> json) =>
      PropiedadesPublic(
        cantidadBanosPropiedad: json["cantidad_banos_propiedad"],
        cantidadHabitacionesPropiedad: json["cantidad_habitaciones_propiedad"],
        ciudadPropiedad: json["ciudad_propiedad"],
        comisionPropiedad: json["comision_propiedad"],
        descripcionPropiedad: json["descripcion_propiedad"],
        estadoPropiedad: json["estado_propiedad"],
        exclusividadPropiedad: json["exclusividad_propiedad"],
        fechaPropiedad: json["fecha_propiedad"],
        foto1: json["foto1"],
        garajePropiedad: json["garaje_propiedad"],
        modalidadPropiedad: json["modalidad_propiedad"],
        precioPropiedad: json["precio_propiedad"] ?? 0.10,
        restriccionesPropiedad: json["restricciones_propiedad"],
        tipoPropiedad: json["tipo_propiedad"],
        ubicacionPropiedad: json["ubicacion_propiedad"],
      );

  Map<String, dynamic> toMap() => {
        "cantidad_banos_propiedad": cantidadBanosPropiedad,
        "cantidad_habitaciones_propiedad": cantidadHabitacionesPropiedad,
        "ciudad_propiedad": ciudadPropiedad,
        "comision_propiedad": comisionPropiedad,
        "descripcion_propiedad": descripcionPropiedad,
        "estado_propiedad": estadoPropiedad,
        "exclusividad_propiedad": exclusividadPropiedad,
        "fecha_propiedad": fechaPropiedad,
        "foto1": foto1,
        "garaje_propiedad": garajePropiedad,
        "modalidad_propiedad": modalidadPropiedad,
        "precio_propiedad": precioPropiedad,
        "restricciones_propiedad": restriccionesPropiedad,
        "tipo_propiedad": tipoPropiedad,
        "ubicacion_propiedad": ubicacionPropiedad,
      };

  PropiedadesPublic copy() => PropiedadesPublic(
        idpropiedad: this.idpropiedad,
        cantidadBanosPropiedad: this.cantidadBanosPropiedad,
        cantidadHabitacionesPropiedad: this.cantidadHabitacionesPropiedad,
        ciudadPropiedad: this.ciudadPropiedad,
        comisionPropiedad: this.comisionPropiedad,
        descripcionPropiedad: this.descripcionPropiedad,
        estadoPropiedad: this.estadoPropiedad,
        exclusividadPropiedad: this.exclusividadPropiedad,
        fechaPropiedad: this.fechaPropiedad,
        foto1: this.foto1,
        garajePropiedad: this.garajePropiedad,
        modalidadPropiedad: this.modalidadPropiedad,
        precioPropiedad: this.precioPropiedad,
        restriccionesPropiedad: this.restriccionesPropiedad,
        tipoPropiedad: this.tipoPropiedad,
        ubicacionPropiedad: this.ubicacionPropiedad,
      );
}
