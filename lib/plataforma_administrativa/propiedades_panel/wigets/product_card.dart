import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Propiedades propiedad;

  const ProductCard({Key? key, required this.propiedad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        //Vamos a crear un Stack dentro de las cards
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // En esta parte se hace los llamados a los diferentes componentes de la card container
            _BackgroundImage(propiedad.foto1),
            _ProductDetails(
              tipoPropiedad: propiedad.tipoPropiedad,
              modalidadPropiedad: propiedad.modalidadPropiedad!,
              descripcionPropiedad: propiedad.descripcionPropiedad,
            ),
            Positioned(
                top: 0, right: 0, child: _PriceTag(propiedad.precioPropiedad!)),
            //vamos a crear una condicion para el NotAvailable
            if (!propiedad.estadoPropiedad)
              Positioned(top: 0, left: 0, child: _NotAvailable()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]);
}

class _NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.red[800],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double precioPropiedad;

  const _PriceTag(this.precioPropiedad);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$$precioPropiedad',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.deepBlue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String tipoPropiedad;
  final String modalidadPropiedad;
  final String descripcionPropiedad;

  const _ProductDetails(
      {required this.tipoPropiedad,
      required this.descripcionPropiedad,
      required this.modalidadPropiedad});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 100,
        decoration: _BuildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  tipoPropiedad,
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  modalidadPropiedad,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Text(
              descripcionPropiedad,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _BuildBoxDecoration() => BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
      );
}

class _BackgroundImage extends StatelessWidget {
  final String? url;
  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
            ? Image(
                image: AssetImage('assets/images/no-images.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                placeholder: AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
