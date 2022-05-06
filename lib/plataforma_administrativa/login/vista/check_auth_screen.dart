import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthLoginServices>(context, listen: false);
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: authService.readToken(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Text('Validadndo sus credenciales');
          if (snapshot.data == '') {
            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => LoginScreen(),
                    transitionDuration: Duration(seconds: 0),
                  ));
            });
          } else {
            Future.microtask(() {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => TabsPagePanel(),
                    transitionDuration: Duration(seconds: 0),
                  ));
            });
          }

          return Container();
        },
      )),
    );
  }
}
