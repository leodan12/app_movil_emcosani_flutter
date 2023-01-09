
import 'package:appemcosani/utils/responsive.dart';
import 'package:appemcosani/widgets/circle.dart';
import 'package:appemcosani/widgets/iconContainer.dart';
import 'package:appemcosani/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  
  static const routeName = 'login';
  //LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
     
    final double circulo1 =responsive.wp(57);
    final double circulo2 =responsive.wp(80);
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child:Container(
          width: double.infinity,
          height: responsive.height,
          color: Colors.white,
          child: Stack( 
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: -(circulo1)*0.55,
                left: -(circulo1)*0.15, 
                child: Circle(
                  size: circulo1,
                  colors: [
                    Colors.blue,
                    Colors.green,
                  ],
                ),
              ),
              Positioned( 
                top: -(circulo2)*0.4,
                right: -(circulo2)*0.2,
                child: Circle(
                  size: circulo2,
                  colors: [
                    Colors.green,
                    Colors.blue,
                  ],
                ),
              ),
              Positioned(
                top: circulo2*0.37,
                child: Column(  //IconContainer
                  children: <Widget>[
                    IconContainer(
                      size:responsive.wp(15),
                      ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Hola  \n Bienvenido a la App movil de Emcosani!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: responsive.dp(2.5), 
                      ),
                      ),  
                  ]
              ),
              ),
              LoginForm(),  
            ],
          ),
        ),
        ),
      ),
    );
  }
}
