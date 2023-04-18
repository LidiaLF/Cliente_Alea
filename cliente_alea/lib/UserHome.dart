import 'package:flutter/material.dart';
import 'Widgets/CalendarWidget.dart';
import 'LateralMenu.dart';

class UserHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: LateralMenu(), body: CalendarWidget());
  }
}
