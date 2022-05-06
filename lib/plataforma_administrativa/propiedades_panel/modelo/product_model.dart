// To parse this JSON data, do
//
//     final propiedades = propiedadesFromMap(jsonString);

import 'dart:convert';

class Propiedades {
  Propiedades({
    this.idpropiedad,
    required this.apellidosPropietario,
    this.cantidadBanosPropiedad,
    this.cantidadHabitacionesPropiedad,
    required this.celularPropietario,
    this.ciudadPropiedad,
    this.codigoPropiedad,
    this.comisionPropiedad,
    required this.descripcionPropiedad,
    required this.estadoPropiedad,
    this.exclusividadPropiedad,
    this.fechaPropiedad,
    this.fechaPropietario,
    this.foto1,
    this.foto10,
    this.foto2,
    this.foto3,
    this.foto4,
    this.foto5,
    this.foto6,
    this.foto7,
    this.foto8,
    this.foto9,
    this.garajePropiedad,
    this.modalidadPropiedad,
    this.nombrePropietario,
    this.precioPropiedad,
    this.residenciaPropietario,
    this.restriccionesPropiedad,
    required this.tipoPropiedad,
    this.ubicacionPropiedad,
  });
  String? idpropiedad;
  String apellidosPropietario;
  int? cantidadBanosPropiedad;
  int? cantidadHabitacionesPropiedad;
  String celularPropietario;
  String? ciudadPropiedad;
  String? codigoPropiedad;
  double? comisionPropiedad;
  String descripcionPropiedad;
  bool estadoPropiedad;
  bool? exclusividadPropiedad;
  String? fechaPropiedad;
  String? fechaPropietario;
  String? foto1;
  String? foto10;
  String? foto2;
  String? foto3;
  String? foto4;
  String? foto5;
  String? foto6;
  String? foto7;
  String? foto8;
  String? foto9;
  bool? garajePropiedad;
  String? modalidadPropiedad;
  String? nombrePropietario;
  double? precioPropiedad;
  String? residenciaPropietario;
  String? restriccionesPropiedad;
  String tipoPropiedad;
  String? ubicacionPropiedad;

  factory Propiedades.fromJson(String str) =>
      Propiedades.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Propiedades.fromMap(Map<String, dynamic> json) => Propiedades(
        apellidosPropietario: json["apellidos_propietario"],
        cantidadBanosPropiedad: json["cantidad_banos_propiedad"],
        cantidadHabitacionesPropiedad: json["cantidad_habitaciones_propiedad"],
        celularPropietario: json["celular_propietario"],
        ciudadPropiedad: json["ciudad_propiedad"],
        codigoPropiedad: json["codigo_propiedad"],
        comisionPropiedad: json["comision_propiedad"],
        descripcionPropiedad: json["descripcion_propiedad"],
        estadoPropiedad: json["estado_propiedad"],
        exclusividadPropiedad: json["exclusividad_propiedad"],
        fechaPropiedad: json["fecha_propiedad"],
        fechaPropietario: json["fecha_propietario"],
        foto1: json["foto1"],
        foto10: json["foto10"],
        foto2: json["foto2"],
        foto3: json["foto3"],
        foto4: json["foto4"],
        foto5: json["foto5"],
        foto6: json["foto6"],
        foto7: json["foto7"],
        foto8: json["foto8"],
        foto9: json["foto9"],
        garajePropiedad: json["garaje_propiedad"],
        modalidadPropiedad: json["modalidad_propiedad"],
        nombrePropietario: json["nombre_propietario"],
        precioPropiedad: json["precio_propiedad"],
        residenciaPropietario: json["residencia_propietario"],
        restriccionesPropiedad: json["restricciones_propiedad"],
        tipoPropiedad: json["tipo_propiedad"],
        ubicacionPropiedad: json["ubicacion_propiedad"],
      );

  Map<String, dynamic> toMap() => {
        "apellidos_propietario": apellidosPropietario,
        "cantidad_banos_propiedad": cantidadBanosPropiedad,
        "cantidad_habitaciones_propiedad": cantidadHabitacionesPropiedad,
        "celular_propietario": celularPropietario,
        "ciudad_propiedad": ciudadPropiedad,
        "codigo_propiedad": codigoPropiedad,
        "comision_propiedad": comisionPropiedad,
        "descripcion_propiedad": descripcionPropiedad,
        "estado_propiedad": estadoPropiedad,
        "exclusividad_propiedad": exclusividadPropiedad,
        "fecha_propiedad": fechaPropiedad,
        "fecha_propietario": fechaPropietario,
        "foto1": foto1,
        "foto10": foto10,
        "foto2": foto2,
        "foto3": foto3,
        "foto4": foto4,
        "foto5": foto5,
        "foto6": foto6,
        "foto7": foto7,
        "foto8": foto8,
        "foto9": foto9,
        "garaje_propiedad": garajePropiedad,
        "modalidad_propiedad": modalidadPropiedad,
        "nombre_propietario": nombrePropietario,
        "precio_propiedad": precioPropiedad,
        "residencia_propietario": residenciaPropietario,
        "restricciones_propiedad": restriccionesPropiedad,
        "tipo_propiedad": tipoPropiedad,
        "ubicacion_propiedad": ubicacionPropiedad,
      };

  Propiedades copy() => Propiedades(
        idpropiedad: this.idpropiedad,
        apellidosPropietario: this.apellidosPropietario,
        cantidadBanosPropiedad: this.cantidadBanosPropiedad,
        cantidadHabitacionesPropiedad: this.cantidadBanosPropiedad,
        celularPropietario: this.celularPropietario,
        ciudadPropiedad: this.ciudadPropiedad,
        codigoPropiedad: this.codigoPropiedad,
        comisionPropiedad: this.comisionPropiedad,
        descripcionPropiedad: this.descripcionPropiedad,
        estadoPropiedad: this.estadoPropiedad,
        exclusividadPropiedad: this.exclusividadPropiedad,
        fechaPropiedad: this.fechaPropiedad,
        fechaPropietario: this.fechaPropietario,
        foto1: this.foto1,
        foto10: this.foto10,
        foto2: this.foto2,
        foto3: this.foto3,
        foto4: this.foto4,
        foto5: this.foto5,
        foto6: this.foto6,
        foto7: this.foto7,
        foto8: this.foto8,
        foto9: this.foto9,
        garajePropiedad: this.garajePropiedad,
        modalidadPropiedad: this.modalidadPropiedad,
        nombrePropietario: this.nombrePropietario,
        precioPropiedad: this.precioPropiedad,
        residenciaPropietario: this.residenciaPropietario,
        restriccionesPropiedad: this.residenciaPropietario,
        tipoPropiedad: this.tipoPropiedad,
        ubicacionPropiedad: this.ubicacionPropiedad,
      );
}
