import 'package:bienes_raices_app/imports/imports.dart';
import 'package:bienes_raices_app/plataforma_administrativa/login/vista/widgets/widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            // Cuando creamos el widget de en el auth_background const AuthBackground({Key? key,  required this.child}) : super(key: key); ----- nos pide que mandemos un child obligado-----
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          CardContainer(
              child: Text(
                  'Bienvenidos al panel administrador, solo para personal autorizado')),

          SizedBox(
            height: 20,
          ), // Aca vamos llamar el contenedor de los fields o card container
          CardContainer(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Admin Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                //Aca vamos a llamar el login Form para crear los formularios
                // Vamos a envolver en un change Notify que esta en el modelo
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: _LoginForm(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 50,
          ),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Vamos a crear un login form que nos permita dar acceso a nuestra clase del modelo login_form
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      // Vamos a crear
      child: Form(
        //Aca conectamos el modelo login_form con el key
        key: loginForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            //------//
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              //Aca vamos llamar a la clase que creamos en el UI input_decoration
              decoration: InputDecorations.authInputDecoration(
                  //Aca nos va mostrar un error porque no estamos el hintText ni el labelText que definimos en el inpu_decoration como required
                  hintText: 'example@gmail.com',
                  labelText: 'Correo ELectrónico',
                  prefixIcon: Icons.alternate_email_rounded),
              // Lo que se va recibir en el field de email lo vamos a guardar en value y guardarlo en loginFrom
              onChanged: (value) => loginForm.email = value,
              //Vamos a crear los validadores por si se introduce datos no validos
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El correo no es valido';
              },
            ),

            SizedBox(
              height: 30,
            ),
            //------//
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              //Aca vamos llamar a la clase que creamos en el UI input_decoration
              decoration: InputDecorations.authInputDecoration(
                  //Aca nos va mostrar un error porque no estamos el hintText ni el labelText que definimos en el inpu_decoration como required
                  hintText: '*********',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_outline),
              // Lo que se va recibir en el field de contraseña lo vamos a guardar en value y guardarlo en loginFrom
              onChanged: (value) => loginForm.password = value,
              //Vamos a crear los validadores por si se introduce datos no validos
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'La contraseña debe tener mas de 6 caracteres';
              },
            ),
            SizedBox(
              height: 30,
            ),

            //Aca vamos a implementar los botones
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.blueAccent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Cargando' : 'Ingresar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();
                        final authService = Provider.of<AuthLoginServices>(
                            context,
                            listen: false);

                        if (!loginForm.isValidForm()) return;
                        loginForm.isLoading = true;
                        // validar si el login es correcto
                        final String? errorMessage = await authService.login(
                            loginForm.email, loginForm.password);
                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(
                              context, 'TabsPagePanel');
                        } else {
                          NotificaionloginServices.showSnackBar(
                              'Los siento su Credencial no es Válido');
                          print(errorMessage + ' Credenciales No Validas');
                          loginForm.isLoading = false;
                        }
                      }),

            //------//
          ],
        ),
      ),
    );
  }
}
