import 'package:cliente_alea/LateralMenu.dart';
import 'package:flutter/material.dart';


class FiscalScreen extends StatelessWidget {
  const FiscalScreen({super.key});

  @override
  Widget build(BuildContext context) {
 // Scaffold(drawer: LateralMenu(), body: CalendarWidget())
    return
      Scaffold(
        drawer: LateralMenu(),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
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