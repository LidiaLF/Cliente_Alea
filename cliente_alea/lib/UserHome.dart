import 'package:cliente_alea/Widgets/CalendarWidget.dart';
import 'package:flutter/material.dart';
import 'LateralMenu.dart';

class UserHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LateralMenu(),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 200),
        child: CalendarWidget(),
      ),
      body: Container(),
    );
  }
}
