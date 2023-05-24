import 'package:cliente_alea/Values/My_Colors.dart';
import 'package:cliente_alea/Values/My_Strings.dart';
import 'package:cliente_alea/Widgets/ContactList.dart';
import 'package:cliente_alea/class/Emp.dart';
import 'package:flutter/material.dart';
import 'LateralMenu.dart';

class ContactsScreen extends StatelessWidget {
  // backing data
  final emps = [
    Emp("Tania", "info@aleaasesores.com", "Info", 666666),
    Emp("Lidia", "lidia@aleaasesores.com", "Laboral", 620653964)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(My_Strings.contactar),
        automaticallyImplyLeading: true,
        backgroundColor: My_Colors.yellow_alea_dark,
      ),
      drawer: LateralMenu(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
            itemCount: emps.length,
            itemBuilder: (context, index) {
              return ContactList(emp: emps[index]);
            },
          );
        },
      ),
    );
  }
}
