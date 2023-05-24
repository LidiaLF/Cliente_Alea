import 'package:cliente_alea/Values/My_Strings.dart';
import 'package:cliente_alea/class/Emp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactList extends StatelessWidget {
  final Emp emp;

  ContactList({required this.emp});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(Icons.person, size: 48.0),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    emp.name,
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "${My_Strings.dept}${emp.dept}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.alternate_email),
                      SizedBox(width: 8.0),
                      GestureDetector(
                        child: Text(
                          emp.email,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () => _launchURL('mailto:${emp.email}?subject=Asunto&body=Mensaje'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8.0),
                      GestureDetector(
                        child: Text(
                          "${emp.phone}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () => _launchURL("tel:${emp.phone}"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    await launch(url);
  }
}
