import 'package:appemcosani/data/authentication_client.dart';
import 'package:appemcosani/pages/home_page.dart';
import 'package:appemcosani/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  //final authenticationClient = GetIt.instance<AuthenticationClient>(); //es lo mismo que la siguiente linea
  final AuthenticationClient _authenticationClient = GetIt.instance<AuthenticationClient>();
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLogin();
     });
  }

  Future<void> _checkLogin() async {
    final token = await _authenticationClient.accessToken; 
   // final id = await _authenticationClient.accessId; 
    if(token == null){
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
      return ;
    }
   // else if(id == null){
    //  Navigator.pushReplacementNamed(context, LoginPage.routeName);
    //  return ;
   // }
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
        ),
    );
  }
}