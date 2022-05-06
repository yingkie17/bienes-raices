import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicacionProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final propiedadServicio = Provider.of<PropiedadesServicio>(context);
    return ChangeNotifierProvider(
      create: (_) =>
          PropiedadesPublicFormProvider(propiedadServicio.selectedProduct),
      child: _PropiedadesScreenBody(propiedadesServicio: propiedadServicio),
    );
    // return _PropiedadesScreenBody(propiedadesServicio: propiedadServicio,);
  }
}

class _PropiedadesScreenBody extends StatelessWidget {
  const _PropiedadesScreenBody({
    Key? key,
    required this.propiedadesServicio,
  }) : super(key: key);
  final PropiedadesServicio propiedadesServicio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.indigo,
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.indigo,
            child: Column(
              children: [
                Stack(
                  children: [
                    PublicacionImage(
                      url: propiedadesServicio.selectedProduct.foto1,
                    ),
                    SafeArea(
                      child: Positioned(
                          child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back,
                          size: 40,
                          color: Colors.white,
                        ),
                      )),
                    )
                  ],
                ),
                _publicaionForm(),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class _publicaionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final propiedadesForm = Provider.of<PropiedadesPublicFormProvider>(context);
    final propiedad = propiedadesForm.propiedadPublic;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _BuildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),

              //======Header Tittle=====//
              Center(
                child: Text(
                  'DATOS DE LA PROPIEDAD',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //====Tipo De Propiedad====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Tipo de Propiedad',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 35, top: 20, right: 35),
                          child: Text(
                            propiedad.tipoPropiedad,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //==== Modalidad de Servicio====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Modalidad de Servicio',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 20, right: 35),
                        child: Text(
                          propiedad.modalidadPropiedad,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //====Fecha de Registro ====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Fecha de Registro',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 20, right: 35),
                        child: Text(
                          propiedad.fechaPropiedad,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //==== Precio de la Propiedad ====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Precio de Propiedad',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 20, right: 35),
                        child: Text(
                          '\$' + propiedad.precioPropiedad.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //==== Comision De Propiedad====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Comision',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 20, right: 35),
                        child: Text(
                          '\$' + propiedad.comisionPropiedad.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //==== Ciudad  De Propiedad====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Ciudad',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 35, top: 20, right: 35),
                          child: Text(
                            propiedad.ciudadPropiedad!,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //==== Ubicación De Propiedad====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Ubicación de la Propiedad',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 35, top: 20, right: 35),
                          child: Text(
                            propiedad.ubicacionPropiedad!,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //==== Cantidad de Habitaciones ====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Cantidad de Habitaciones',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 20, right: 35),
                        child: Text(
                          propiedad.cantidadHabitacionesPropiedad.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //====Cantidad de Baños====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Cantidad de Baños',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 35, top: 20, right: 35),
                        child: Text(
                          propiedad.cantidadBanosPropiedad.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //====Restricciones De Propiedad====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Restricciones',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 35, top: 20, right: 35),
                          child: Text(
                            propiedad.restriccionesPropiedad!,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              //==== Descripcion de la Propiedad ====//
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.orange,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Descricpcion de la Propiedad',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 35, top: 20, right: 35),
                          child: Text(
                            propiedad.descripcionPropiedad,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //======= Galeria de Imagenes =====//

              //======= End of Galeria d Imagenes =====//

              //====== Realizar Consulta ====//
              //Aca vamos a implementar los botones

              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.indigo,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      'Consultar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Contacto');
                  }),

              SizedBox(
                height: 30,
              ),
              //======  End of Realizar Consulta ====//
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 5),
              blurRadius: 5),
        ],
      );
}
