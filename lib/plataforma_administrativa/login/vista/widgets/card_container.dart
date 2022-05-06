import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: _createCardShape(),
        // ignore: unnecessary_this
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: Offset(0, 5),
          )
        ],
      );
}
