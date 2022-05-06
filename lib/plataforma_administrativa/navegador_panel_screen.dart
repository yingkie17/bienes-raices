import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPagePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navegation(),
      ),
    );
  }
}

class _Navegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavigationModel>(context);
    final publicacionService = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Propiedades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Usuarios',
          ),
        ]);
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      controller: navigationModel.pagecontroller,
      physics: NeverScrollableScrollPhysics(),
      children: [
        PropiedadesPanel(),
        RegistroScreen(),
      ],
    );
  }
}

//vamos a crear una clase para manejar con el getter y setter para poder manejar el Provider y avisar que empiece a iniciarse esta parte
class _NavigationModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController(initialPage: 0);
  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(microseconds: 300), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pagecontroller => this._pageController;
}
