import 'package:cliente_alea/Widgets/CalendarWidget.dart';
import 'package:flutter/material.dart';
import 'LateralMenu.dart';
import 'Widgets/ListNewsWidget.dart';

class UserHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LateralMenu(),
      body: Container(
          child: Column(
        children: [CalendarWidget(), Expanded(child: ListNewsWidget())],
      )),
    );
  }
}
