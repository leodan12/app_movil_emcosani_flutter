 
import 'dart:convert';

import 'package:appemcosani/api/authentication_api.dart';
import 'package:appemcosani/helpers/http_response.dart';
import 'package:appemcosani/pages/home_page.dart';
import 'package:appemcosani/utils/dialogs.dart';
import 'package:appemcosani/utils/responsive.dart';

import 'input_text.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String _email = '', _password = '', _username = '';
  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  Future<void> _submit() async {
    final isOK = _formkey.currentState!.validate();
    print("form isOK: $isOK");
    if (isOK) {
      //aca se llama a la api rest para el registro
      ProgressDialog.show(context);

      final HttpResponse response = await _authenticationAPI.register(
          username: _username,
          email: _email,
          password: _password,

       );
       ProgressDialog.dissmiss(context);

       if(response.data != null){
        print("registro ok ${response.data}");
        Navigator.pushNamedAndRemoveUntil(
          context, 
          HomePage.routeName,
          (_)=> false //route.settings.name=='perfil',
          );
       }else{
        print("codigo de error: ${response.error.statusCode}" );
        print("mensaje de error: ${response.error.message}");
        print("datos del error: ${response.error.data}");

        String message = response.error.message;

        if(response.error.statusCode == -1){
          message= "Sin Conexion a Internet";
        }else if(response.error.statusCode == 409){
          message= "Usuario Duplicado: ${jsonEncode(response.error.data['message'])} ";
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
                    return ('Correo invalido');
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(2.5),   ),
              InputText(
                label: "Nombre de Usuario",
                keyboardType: TextInputType.emailAddress,
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  //print("email: $text");
                  _username = text;
                },
                validator: (text) {
                  if (text!.trim().length<5) {
                    return ('Nombre de Usuario  invalido');
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(5),  ),
              InputText(
                label: "Contraseña",
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  //print("email: $text");
                  _password = text;
                },
                validator: (text) {
                  if (text!.trim().length<5) {
                    return ('Contraseña  invalida');
                  }
                  return null;
                },
              ),
               SizedBox(
                height: responsive.dp(5),  ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Registrarse",
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
                    "¿Ya tienes una cuenta?",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  MaterialButton(
                    child: Text(
                      "Inicia Sesion",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
