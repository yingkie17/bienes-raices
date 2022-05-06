import 'package:flutter/material.dart';
import 'package:bienes_raices_app/imports/imports.dart';
import 'package:provider/provider.dart';

class PropiedadesPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productServices = Provider.of<ProductService>(context);
    final authServices = Provider.of<AuthLoginServices>(context, listen: false);

    if (productServices.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Propiedades',
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              authServices.logout();
              Navigator.pushReplacementNamed(context, 'Home');
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15, right: 0),
              child: Text(
                'Salir',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              authServices.logout();
              Navigator.pushReplacementNamed(context, 'Home');
            },
            icon: Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: productServices.propiedades.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                child: ProductCard(
                  propiedad: productServices.propiedades[index],
                ),
                onTap: () {
                  productServices.selectedProduct =
                      productServices.propiedades[index].copy();
                  Navigator.pushNamed(context, 'Product');
                },
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productServices.selectedProduct = new Propiedades(
            apellidosPropietario: ' ',
            cantidadBanosPropiedad: 0,
            cantidadHabitacionesPropiedad: 0,
            celularPropietario: ' ',
            ciudadPropiedad: ' ',
            codigoPropiedad: ' ',
            comisionPropiedad: 1.1,
            descripcionPropiedad: ' ',
            estadoPropiedad: false,
            exclusividadPropiedad: false,
            fechaPropiedad: ' ',
            fechaPropietario: ' ',
            foto1:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            foto10:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            foto2:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            foto3:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            foto5:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            foto6:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            foto7:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            foto8:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            foto4:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/no_disponible_sqtyzb.png',
            foto9:
                'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645541447/public/imageCarga_vhvq9a.jpg',
            garajePropiedad: false,
            modalidadPropiedad: ' ',
            nombrePropietario: ' ',
            precioPropiedad: 1.1,
            residenciaPropietario: ' ',
            restriccionesPropiedad: ' ',
            tipoPropiedad: ' ',
            ubicacionPropiedad: ' ',
          );

          Navigator.pushNamed(context, 'Product');
        },
      ),
    );
  }
}
