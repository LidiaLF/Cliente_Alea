import 'package:cliente_alea/Values/My_Strings.dart';
import 'package:cliente_alea/class/Emp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactList extends StatelessWidget {
  final Emp emp;

  ContactList({required this.emp});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: Text("")),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(emp.name),
                Text(My_Strings.dept + emp.dept),
              ],
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.alternate_email),
              onPressed: () =>
                  _launchURL('mailto:${emp.email}?subject=Asunto&body=Mensaje'),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () => _launchURL("tel:${emp.phone}"),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(url) async {
    await launch(url);
  }
}