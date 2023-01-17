import 'package:appemcosani/pages/home_page.dart';
import 'package:appemcosani/utils/responsive.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  static const routeName = 'inicio';
  const InicioPage({super.key});

   @override
  Widget build(BuildContext context) {
     final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(responsive.hp(100)),
        child: HomePage( ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pagina de Inicio"),
             
          ],
        ),
      ),
    );
  }
}

 