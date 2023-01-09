import 'dart:convert';

import 'package:appemcosani/pages/home_page.dart';
import 'package:appemcosani/utils/responsive.dart';
import 'package:appemcosani/api/authentication_api.dart';

import 'package:appemcosani/helpers/http_response.dart';
import 'package:get_it/get_it.dart';
import 'input_text.dart';
import 'package:flutter/material.dart';
import 'package:appemcosani/utils/dialogs.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String _email = '', _password = '';
  //final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  Future<void> _submit() async {
    final isOK = _formkey.currentState!.validate();
    print("form isOK: $isOK");
    if (isOK) {
      //aca se llama a la api rest para el login

      ProgressDialog.show(context);

      final authenticationAPI = GetIt.instance<AuthenticationAPI>();

      final HttpResponse response = await authenticationAPI.login(
        email: _email,
        password: _password,
      );
      ProgressDialog.dissmiss(context);
      
      if (response.data != null) { 
        print("registro ok ${response.data}");
        Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName,
            (_) => false //route.settings.name=='perfil',
            );
      } else {
        print("codigo de error: ${response.error.statusCode}");
        print("mensaje de error: ${response.error.message}");
        print("datos del error: ${response.error.data}");

        String message = response.error.message;

        if (response.error.statusCode == -1) {
          message = "Sin Conexion a Internet";
        } else if (response.error.statusCode == 404) {
          message = "• ${jsonEncode(response.error.data['message'])} ";
        } else if (response.error.statusCode == 403) {
          message = "• ${jsonEncode(response.error.data['message'])} ";
        }

        Dialogs.alert(context, title: "Error", description: message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 300,
        ),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              InputText(
                label: "Correo Electronico",
                keyboardType: TextInputType.emailAddress,
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  //print("email: $text");
                  _email = text;
                },
                validator: (text) {
                  if (!text!.contains('@')) {
                    return ('Correo Invalido');
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(2.5),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                        label: "Contraseña",
                        obscureText: true,
                        borderEnabled: false,
                        fontSize:
                            responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                        onChanged: (text) {
                          //print("password: $text");
                          _password = text;
                        },
                        validator: (text) {
                          if (text!.trim().length == 0) {
                            return ('Contraseña Invalida');
                          }
                          return null;
                        },
                      ),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Olvidaste tu Contraseña?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              responsive.dp(responsive.isTablet ? 1.1 : 1.3),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: responsive.dp(5),
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Ingresar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsive.dp(responsive.isTablet ? 1.1 : 1.4),
                    ),
                  ),
                  onPressed: this._submit,
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "¿Eres Nuevo en Emcosani?",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  MaterialButton(
                    child: Text(
                      "Registrate",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: responsive.dp(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
