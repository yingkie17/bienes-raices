import 'package:bienes_raices_app/home/home_splash/splash.dart';
import 'package:bienes_raices_app/imports/imports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

//vamos a necesitar instanciar el product Service del controlador de manera global en todo momento, para lo cual haremos uso del provider
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PropiedadesServicio()),
        ChangeNotifierProvider(create: (_) => AuthLoginServices()),
        ChangeNotifierProvider(create: (_) => AuthRegistroServices()),
        ChangeNotifierProvider(create: (_) => ProductService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bienes Raices Japebu',
      initialRoute: 'SplashScreen',
      routes: {
        'PropiedadesPanel': (_) => PropiedadesPanel(),
        'CheckAuth': (_) => CheckAuth(),
        'Home': (_) => HomeScreen(),
        'Login': (_) => LoginScreen(),
        'Product': (_) => ProductScreen(),
        'Publicaciones': (_) => HomeScreen(),
        'PublicProducts': (_) => PublicacionProductScreen(),
        'Registro': (_) => RegistroScreen(),
        'TabsPagePanel': (_) => TabsPagePanel(),
        'SplashScreen': (_) => Splashscreen(),
        'Contacto': (_) => ContactoScreen(),
      },
      scaffoldMessengerKey: NotificaionloginServices.messengerKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.blueAccent,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.orange,
            elevation: 0,
          )),
    );
  }
}
