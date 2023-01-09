 
import 'package:appemcosani/helpers/dependency_injection.dart';
import 'package:appemcosani/pages/home_page.dart';
import 'package:appemcosani/pages/login_page.dart';
import 'package:appemcosani/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  DependencyInjection.initialize();
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),//const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        RegisterPage.routeName:(_) => RegisterPage(),
        LoginPage.routeName:(_) => LoginPage(),
        HomePage.routeName:(_) => HomePage(),
      },
    );
  }
}
