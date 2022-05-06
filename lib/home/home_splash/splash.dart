import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState() {
    super.initState();
    _navigateHomeScreen();
  }

  _navigateHomeScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacementNamed(context, 'Home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: ListView(
              children: const [
                Image(
                  image: AssetImage('assets/images/Unandes.jpeg'),
                ),
                Center(
                    child: Text(
                  'Proyecto de Grado',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.indigo,
                  ),
                )),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'DESARROLLO DE UNA APLICACIÓN MÓVIL PARA LA GESTIÓN DE PROCESOS DE NEGOCIO EN INMOBILIARIA CASO: JAPEBU Bienes Raíces Inversiones S.R.L',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Postulante: Herbert Ying Kie Lee Covarrubias',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tutor: Ing. Daniel Guillermo Salamanca Kacic',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
