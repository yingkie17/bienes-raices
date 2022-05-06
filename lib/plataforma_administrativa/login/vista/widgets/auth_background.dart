import 'package:flutter/material.dart';
import 'package:bienes_raices_app/imports/imports.dart';

class AuthBackground extends StatelessWidget {
//vamos a crearun widget que sera el que contenga las propiedades del contenedor de los fields
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          //En Este Sector vamos a crear la parte lila superior que sera de tipo Widgets y contendra burbujas de fondo

          _PurpleBox(),
          // En este Sector vamos agregar el Icono de cabecera
          _HeaderIcon(),
          // Vamos a llamar la variable final child de tipo widget
          // ignore: unnecessary_this
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        child: Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
//---------Se créo la clase que contendra las burbujas

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _purpleBackgound(),
      child: Stack(
        children: [
          // aca vamos a llamar un widgets de tipo privado que seran los circulos o burbujas transparentes
          _Bubble(),
          Positioned(
            child: _Bubble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Bubble(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: _Bubble(),
            top: -50,
            right: -20,
          ),
          Positioned(
            child: _Bubble(),
            bottom: -50,
            left: 10,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 120,
            right: 20,
          ),
        ],
      ),
    );
  }

//----- Creamos el metodo para el fondo de la parte superior
  BoxDecoration _purpleBackgound() => BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.indigo,
          Colors.indigoAccent,
        ]),
      );
}

//---- Creamos la clase que contensra los estilos de las burbujas
class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
