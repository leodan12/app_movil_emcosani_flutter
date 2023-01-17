

import 'package:flutter/material.dart'; 


class MiInicio extends StatelessWidget {
  const MiInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(30),
          child: Text(
            "Bienvenido a la App movil de Emcosani",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18, 
              ) 
            ),
        ),
        Container(  
          child: Center(
            child: 
            Image.network("https://www.shutterstock.com/image-vector/bienvenido-welcome-spanish-text-lettering-260nw-146506775.jpg")),
        ),
      ],
    );
  }
}