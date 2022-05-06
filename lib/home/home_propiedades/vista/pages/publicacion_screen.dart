import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final propiedadesServicio = Provider.of<PropiedadesServicio>(context);

    //Si esta cargando vamos a mostrar el widget Loading
    if (propiedadesServicio.isLoading) return LoadingScreen();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Oferta de Propiedades',
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () => showSearch(
                  context: context, delegate: PropiedadSearchDelegate()),
              icon: Icon(Icons.search),
            )
          ],
          //==================Aca el Buscador ================//
        ),
        body: ListView.builder(
            itemCount: propiedadesServicio.propiedadesPublic.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () {
                    propiedadesServicio.selectedProduct =
                        propiedadesServicio.propiedadesPublic[index].copy();
                    Navigator.pushNamed(context, 'PublicProducts');
                  },
                  child: PublicacionCard(
                    propiedadPublic:
                        propiedadesServicio.propiedadesPublic[index],
                  ),
                )));
  }
}
