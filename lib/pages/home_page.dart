import 'package:appemcosani/api/user_data.dart';
import 'package:appemcosani/data/authentication_client.dart';
import 'package:appemcosani/pages/login_page.dart';
import 'package:appemcosani/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authenticationClient = GetIt.instance<AuthenticationClient>();

  var miIdUser = 1;
  var miNameUser = "mi Nombre";
  var miEmailUser = "mi Email";

  @override
  void initState() {
    super.initState();
    _traerDatos();
  }

  Future<void> _traerDatos() async {
    final id = await _authenticationClient.accessId;
    final name = await _authenticationClient.accessName;
    final email = await _authenticationClient.accessEmail;
    if (id != null) {
      miIdUser = id;
    }
    if (name != null) {
      miNameUser = name;
    }
    if (email != null) {
      miEmailUser = email;
    }
    setState(() {});
  }

  Future<void> _singOut() async {
    await _authenticationClient.singOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginPage.routeName,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.blue],
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(responsive.hp(5)),
                child: ClipOval(
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKvoqmKhRuuCjPmGxrUjfZ6grgZg7wP2Vya17z5q-4l86XEgeot4rc_buraKavb7OFfiA&usqp=CAU"),
                ),
              ),
              Text(
                "Mis Datos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.dp(1.5),
                ),
              ),
              SizedBox(
                height: responsive.dp(1),
              ),
              Text(
                miNameUser,
                style: TextStyle(
                  fontSize: responsive.dp(1.5),
                ),
              ),
              SizedBox(
                height: responsive.dp(1),
              ),
              Text(
                miEmailUser,
                style: TextStyle(
                  fontSize: responsive.dp(1.5),
                ),
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
               
              SizedBox(
                height: responsive.dp(3),
              ),
              Container(
                margin: EdgeInsets.only(bottom:responsive.hp(1) ),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue.shade300,
                  child: Text(
                    "INICIO",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                ),
              ),
              Text(
                "REPORTES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.dp(1.5),
                ),
              ),
              SizedBox(
                height: responsive.dp(1),
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue.shade300,
                  child: Text(
                    "VENTAS",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                ),
              ),
               Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue.shade300,
                  child: Text(
                    "COMPRAS",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue.shade300,
                  child: Text(
                    "PRODUCTOS",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.blue.shade300,
                  child: Text(
                    "INVENTARIOS",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                ),
              ),
              Expanded(child: Container(),),
              Container(
                width: double.infinity, 
                margin: EdgeInsets.only(top: responsive.hp(0.01), bottom: responsive.hp(1),), 
                child: MaterialButton(
                  color: Colors.red.shade300,
                  onPressed: () => _singOut(),
                  child: Text(
                    "Salir",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Image.network(
          "https://media.licdn.com/dms/image/C561BAQHTn_lkS7--Yw/company-background_10000/0/1609806885857?e=1674450000&v=beta&t=2iiX1LGv5-UtUdMhhWE5pQ5aGK6QidoI5pQxO4PDu0E",
          //width: double.infinity,
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () => _singOut(),
              child: Text("Salir"),
            ),
          ],
        ),
      ),
    );
  }
}
