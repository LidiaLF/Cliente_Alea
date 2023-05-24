import 'package:cliente_alea/LateralMenu.dart';
import 'package:flutter/material.dart';

class FiscalScreen extends StatelessWidget {
  const FiscalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold(drawer: LateralMenu(), body: CalendarWidget())
    return Scaffold(
      drawer: LateralMenu(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Center(
            child: Text(
              'Facturas $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }),
      ),
    );
  }
}
