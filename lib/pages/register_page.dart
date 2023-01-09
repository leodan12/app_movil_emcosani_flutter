import 'package:appemcosani/utils/responsive.dart';
import 'package:appemcosani/widgets/avatar_button.dart';
import 'package:appemcosani/widgets/circle.dart';
import 'package:appemcosani/widgets/register_form.dart';  
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  
  static const routeName = 'register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double circulo1 = responsive.wp(57);
    final double circulo2 = responsive.wp(85);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -(circulo1) * 0.4,
                  left: -(circulo1) * 0.15,
                  child: Circle(
                    size: circulo1,
                    colors: [
                      Colors.blue,
                      Colors.green,
                    ],
                  ),
                ),
                Positioned(
                  top: -(circulo2) * 0.4,
                  right: -(circulo2) * 0.2,
                  child: Circle(
                    size: circulo2,
                    colors: [
                      Colors.green,
                      Colors.blue,
                    ],
                  ),
                ),
                Positioned(
                  top: circulo2 * 0.1,
                  child: Column(//IconContainer
                      children: <Widget>[
                    Text(
                      "Hola  \n Registrese para iniciar!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: responsive.dp(2.5),
                      ),
                    ),
                    SizedBox(
                      height: responsive.dp(4.5),
                    ),
                  AvatarButton(
                    imageSize: responsive.wp(25),
                  ),
                  ]),
                ),
                RegisterForm(),
                Positioned(
                    left: 15,
                    top: 15,
                    child: SafeArea(
                      child: CupertinoButton(
                        color: Colors.black26,
                        padding: EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
