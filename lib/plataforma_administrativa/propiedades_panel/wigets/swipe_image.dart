import 'package:flutter/material.dart';
import 'package:bienes_raices_app/imports/imports.dart';
import 'dart:io';

class SwipeImage extends StatelessWidget {
  final String? url;

  const SwipeImage({this.url});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      width: size.width * 0.9,
      child: getIamge(url!),
    );
  }

  Widget getIamge(String fotoPortada) {
    if (fotoPortada == null)
      return Image(
        image: AssetImage('assets/images/imageCarga.jpg'),
        fit: BoxFit.cover,
      );

    if (fotoPortada.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(this.url!),
        placeholder: AssetImage('assets/images/jar-loading.gif'),
        fit: BoxFit.cover,
      );
    }

    return Image.file(
      File(fotoPortada),
      fit: BoxFit.contain,
    );
  }
}
