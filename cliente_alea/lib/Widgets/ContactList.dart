import 'package:cliente_alea/class/Emp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactList {
  Widget getContact(Emp emp) {
    return Container(
        child: Row(
      children: [
        Expanded(child: Text("")),
        Expanded(
            flex: 2,
            child: Column(children: [
              Text(emp.name),
              Text(
                "Departamento de  ${emp.dept}",
              )
            ])),
        Expanded(child: Icon(Icons.alternate_email)),
        Expanded(
            child: IconButton(
          icon: Icon(Icons.phone),
          onPressed: () => _launchURL("www.google.com"),
        ))
      ],
    ));
  }

  _launchURL(url) async {
    await launch("www.google.com");
  }

  void callEmp(int phone) {}
  Future<void> sendEmail(String email) async {
    String subject = 'This is a test email';
    String body = 'This is a test email body';

    String emailUrl = "mailto:$email?subject=$subject&body=$body";

    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw "Error occured sending an email";
    }
  }
}
