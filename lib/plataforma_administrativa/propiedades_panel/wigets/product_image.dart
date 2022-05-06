import 'package:flutter/material.dart';
import 'package:bienes_raices_app/imports/imports.dart';
import 'dart:io';

class ProductImage extends StatelessWidget {
  final String? url;

  const ProductImage({this.url});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buidBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: getIamge(url!),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buidBoxDecoration() => BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 5))
          ]);

  Widget getIamge(String foto1) {
    if (foto1 == null)
      return Image(
        image: AssetImage('assets/images/imageCarga.jpg'),
        fit: BoxFit.cover,
      );

    if (foto1.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(this.url!),
        placeholder: AssetImage('assets/images/jar-loading.gif'),
        fit: BoxFit.cover,
      );
    }
    ;
    return Image.file(
      File(foto1),
      fit: BoxFit.cover,
    );
  }
}
