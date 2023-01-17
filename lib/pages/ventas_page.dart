import 'package:appemcosani/pages/home_page.dart';
import 'package:appemcosani/utils/responsive.dart';
import 'package:flutter/material.dart';

class VentasPage extends StatelessWidget {
  static const routeName = 'ventas';
  const VentasPage({super.key});

   @override
  Widget build(BuildContext context) {
     final Responsive responsive = Responsive.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(responsive.hp(50)),
        child: HomePage( ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pagina de Ventas"),
            MaterialButton(
              child: Text("Volver al Inicio"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

 