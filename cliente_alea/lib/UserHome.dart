import 'package:cliente_alea/Values/My_Colors.dart';
import 'package:cliente_alea/values/Strings.dart';
import 'package:flutter/material.dart';


class UserHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(),
          drawer: MenuLateral(),
          body: Center(
            child: Text("HOME"),
          ),
    );
  }
}
class MenuLateral extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("CODEA APP"),
            accountEmail: Text("informes@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://dominio.com/imagen/recurso.jpg"),
                    fit: BoxFit.cover
                )
            ),
          ),
          Ink(
            color: My_Colors.yellow_alea_light,
            child: new ListTile(
              title: Text(Strings.info, style: TextStyle(color: Colors.white),),
            ),
          ),
          new ListTile(
            title: Text(Strings.laboral),
            onTap: (){},
          ),
          new ListTile(
            title: Text(Strings.fiscal),
          ),
          new ListTile(
            title: Text(Strings.seguros),
          ), new ListTile(
            title: Text(Strings.contactar),
          ),
          new ListTile(
            title: Text(Strings.config),
          ),
          new ListTile(
            title: Text(Strings.exit),
          ),

        ],
      ) ,
    );
  }
}