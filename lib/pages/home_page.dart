import 'package:appemcosani/api/user_data.dart';
import 'package:appemcosani/data/authentication_client.dart';
import 'package:appemcosani/pages/inicio_home.dart';
import 'package:appemcosani/pages/grafico.dart';
import 'package:appemcosani/pages/inicio_page.dart';
import 'package:appemcosani/pages/lineal_chart.dart';
import 'package:appemcosani/pages/login_page.dart';
import 'package:appemcosani/pages/productos_page.dart';
import 'package:appemcosani/pages/ventas_page.dart';
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
    if (id != null)   miIdUser = id; 
    if (name != null)    miNameUser = name; 
    if (email != null)   miEmailUser = email; 
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

  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return MiInicio();
      case 1: return LinearChart(); 
      case 2: return LinearChart() ;
      case 3: return Grafico();
      case 4: return ProductoPage();
    }
  }

  _onSelectItem(int pos){
    
    Navigator.of(context).pop();
    setState(() { 
      _selectDrawerItem = pos;
     });
    
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    var seriesList = null;
    return Scaffold(
      drawer: Drawer(
        child:  ListView(
          
          children: <Widget> [
             
              Column(
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
               ], 
               ),
            Container(
              margin: EdgeInsets.only(
                  top: responsive.hp(5),
                  bottom: responsive.hp(1),
                ),
              child: Center(
                child: Text("Reportes"))), 
            ListTile(
             title: Text('Inicio'),
             leading: Icon(Icons.card_travel),
             selected: (0 == _selectDrawerItem),
             onTap: (){  
              _onSelectItem(0);
              },
            ),
            ListTile(
             title: Text('Ventas'),
             leading: Icon(Icons.card_travel),
             selected: (1 == _selectDrawerItem),
             onTap: (){  
              _onSelectItem(1);
              },
            ),
            ListTile(
             title: Text('Compras'),
            leading: Icon(Icons.event_busy),
             selected: (2 == _selectDrawerItem),
             onTap: (){
              _onSelectItem(2);
              }, 
            ),
            Divider(),
            ListTile(
             title: Text('Inventarios'),
            leading: Icon(Icons.event_busy),
             selected: (3 == _selectDrawerItem),
             onTap: (){
              _onSelectItem(3);
              }, 
            ),
            ListTile(
             title: Text('Productos'),
            leading: Icon(Icons.event_busy),
             selected: (4 == _selectDrawerItem),
             onTap: (){
              _onSelectItem(4);
              }, 
            ),
             Divider(),
             ListTile(
             title: Text('Salir'),
            leading: Icon(Icons.exit_to_app),
             onTap: (){
             _singOut();
              }, 
            ), 
          ],
        ),
      ),
      appBar: AppBar(
        title: Image.network(
          "https://media.licdn.com/dms/image/C561BAQHTn_lkS7--Yw/company-background_10000/0/1609806885857?e=1674450000&v=beta&t=2iiX1LGv5-UtUdMhhWE5pQ5aGK6QidoI5pQxO4PDu0E",
          //width: double.infinity,
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    
    );
  }
}

 