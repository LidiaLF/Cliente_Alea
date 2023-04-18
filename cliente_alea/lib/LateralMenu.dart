import 'package:cliente_alea/ContactsScreen.dart';
import 'package:cliente_alea/FiscalScreen.dart';
import 'package:cliente_alea/LaboralScreen.dart';
import 'package:cliente_alea/UserHome.dart';
import 'package:cliente_alea/UserSettings.dart';
import 'package:cliente_alea/values/My_Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Values/My_Colors.dart';

class LateralMenu extends StatelessWidget {
  final List<MenuOption> options = [
    MenuOption(
      icon: Icons.home,
      title: My_Strings.info,
      screen: UserHome(),
    ),
    MenuOption(
      icon: Icons.work,
      title: My_Strings.laboral,
      screen: LaboralScreen(),
    ),
    MenuOption(
      icon: Icons.account_balance,
      title: My_Strings.fiscal,
      screen: FiscalScreen(),
    ),
    MenuOption(
      icon: Icons.health_and_safety,
      title: My_Strings.seguros,
      screen: ContactsScreen(),
    ),
    MenuOption(
      icon: Icons.quick_contacts_mail,
      title: My_Strings.contactar,
      screen: ContactsScreen(),
    ),
    MenuOption(
      icon: Icons.settings,
      title: My_Strings.config,
      screen: UserSettings(title: 'Settings'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: My_Colors.yellow_alea_dark,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
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
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ...List.generate(
            options.length,
            (index) => Ink(
              child: ListTile(
                leading: Icon(options[index].icon),
                title: Text(
                  options[index].title,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => options[index].screen),
                ),
                splashColor: My_Colors.yellow_alea_light,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(My_Strings.exit),
            onTap: () {
              Navigator.popUntil(context, (ModalRoute.withName('/')));
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}

class MenuOption {
  final IconData icon;
  final String title;
  final Widget screen;

  MenuOption({required this.icon, required this.title, required this.screen});
}
