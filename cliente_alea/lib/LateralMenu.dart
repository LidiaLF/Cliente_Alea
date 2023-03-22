import 'package:cliente_alea/ContactsScreen.dart';
import 'package:cliente_alea/UserHome.dart';
import 'package:cliente_alea/UserSettings.dart';
import 'package:cliente_alea/values/My_Strings.dart';
import 'package:flutter/material.dart';
import 'Values/My_Colors.dart';
import 'Widgets/BackgroundStyle.dart';

class LateralMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      backgroundColor: My_Colors.yellow_alea_dark,
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: My_Colors.yellow_alea_dark),
            accountName: Text("NOME CLIENTE"),
            accountEmail: Text("informes@gmail.com"),
            currentAccountPicture: Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                          "images/icon.jpg",
                        ).image,
                        fit: BoxFit.fill))),
          ),
          Ink(
            color: My_Colors.yellow_alea_light,
            child: new ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  My_Strings.info,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserHome()),
                    )),
          ),
          new ListTile(
            leading: Icon(Icons.work),
            title: Text(My_Strings.laboral),
            onTap: () {},
            splashColor: My_Colors.yellow_alea_light,
          ),
          new ListTile(
            leading: Icon(Icons.account_balance),
            title: Text(My_Strings.fiscal),
            splashColor: My_Colors.yellow_alea_light,
          ),
          new ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text(My_Strings.seguros),
          ),
          new ListTile(
            leading: Icon(Icons.quick_contacts_mail),
            title: Text(My_Strings.contactar),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactsScreen()),
            ),
            splashColor: My_Colors.yellow_alea_light,
          ),
          new ListTile(
            leading: Icon(Icons.settings),
            title: Text(My_Strings.config),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserSettings(title: 'Settings',)),
            ),
          ),
          Divider(),
          new ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(My_Strings.exit),
          ),
        ],
      ),
    );
  }
}
