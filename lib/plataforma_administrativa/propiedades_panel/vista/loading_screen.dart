import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Propiedades'),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.deepBlue,
        ),
      ),
    );
  }
}
