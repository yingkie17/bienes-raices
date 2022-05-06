import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';

class PublicacionCard extends StatelessWidget {
//Aca pasomos la informacion del Card a Details
  final PropiedadesPublic propiedadPublic;

  const PublicacionCard({Key? key, required this.propiedadPublic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: EdgeInsets.only(top: 30, bottom: 30),
          width: double.infinity,
          height: 500,
          decoration: _CardBordes(),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _BackgroundImage(propiedadPublic.foto1),
              if (!propiedadPublic.estadoPropiedad) _NoDisponible(),
              Expanded(
                child: _PublicacionDetalles(
                    tipo: propiedadPublic.tipoPropiedad,
                    modaliad: propiedadPublic.modalidadPropiedad,
                    descripcion: propiedadPublic.descripcionPropiedad),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: _PriceTag(precio: propiedadPublic.precioPropiedad!)),
              Positioned(
                  top: 0,
                  left: 0,
                  child: _CiudadTag(
                    ciudad: propiedadPublic.ciudadPropiedad!,
                  )),
            ],
          ),
        ));
  }

  BoxDecoration _CardBordes() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 10,
          )
        ],
      );
}

class _CiudadTag extends StatelessWidget {
  final String ciudad;

  const _CiudadTag({required this.ciudad});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            ciudad,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double precio;

  const _PriceTag({required this.precio});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      height: 60,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$$precio',
            style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          )),
    );
  }
}

class _PublicacionDetalles extends StatelessWidget {
  final String tipo;
  final String modaliad;
  final String descripcion;

  const _PublicacionDetalles(
      {required this.tipo, required this.modaliad, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      height: size.width * 0.4,
      decoration: _BuildBoxdecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  tipo,
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                modaliad,  
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Expanded(
              child: Text(
                descripcion,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _BuildBoxdecoration() => BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)));
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: Container(
        width: double.infinity,
        height: 500,
        color: Colors.white,
        child: FadeInImage(
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(url!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _NoDisponible extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: Container(
        width: double.infinity,
        height: 500,
        color: Colors.black12,
        child: FadeInImage(
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(
              'https://res.cloudinary.com/unandes-proyectogrado/image/upload/v1645547199/public/no_disponiblePublic_q6gojz.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
