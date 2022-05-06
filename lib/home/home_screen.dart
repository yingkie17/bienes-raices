import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _CurvedNavigationBar(),
        //_Navegation(),
      ),
    );
  }
}

class _CurvedNavigationBar extends StatelessWidget with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavigationModel>(context);
    final itemsCurvedNavigationBar = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.bubble_chart, size: 30),
      Icon(Icons.person, size: 30),
      Icon(Icons.settings, size: 30),
    ];
    return CurvedNavigationBar(
      items: itemsCurvedNavigationBar,
      height: 60,
      index: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
    );
  }
}

class _Navegation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavigationModel>(context);
    final publicacionService = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.indigoAccent,
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.public,
                size: 25,
                color: Colors.white,
              ),
              label: 'Publicaciones',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 25,
                color: Colors.white,
              ),
              label: 'Mensaje',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
                color: Colors.white,
              ),
              label: 'Panel',
              backgroundColor: Colors.white),
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
        PublicacionScreen(),
        ContactoScreen(),
        LoginScreen(),
        VentasScreen(),
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
