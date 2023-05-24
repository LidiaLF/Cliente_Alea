import 'package:cliente_alea/BaixaITScreen.dart';
import 'package:cliente_alea/ContactsScreen.dart';
import 'package:flutter/material.dart';
import 'package:cliente_alea/Values/My_Strings.dart';
import 'LateralMenu.dart';
import 'Values/My_Colors.dart';

class LaboralScreen extends StatelessWidget {
  const LaboralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final numColumns = screenWidth > 768 ? 3 : 2;
    final boxSize = screenWidth / numColumns - 30;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: My_Colors.yellow_alea_dark,
        title: Text(My_Strings.laboral),
      ),
      drawer: LateralMenu(),
      body: GridView.count(
        crossAxisCount: numColumns,
        padding: const EdgeInsets.all(15.0),
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: 1.0,
        children: [
          _buildCategoryBox(context, Icons.computer, My_Strings.dep_Laboral[0], ContactsScreen(), boxSize),
          _buildCategoryBox(context, Icons.local_hospital, My_Strings.dep_Laboral[1], BaixasITScreen(), boxSize),
          _buildCategoryBox(context, Icons.directions_car,My_Strings.dep_Laboral[2], ContactsScreen(), boxSize),
          _buildCategoryBox(context, Icons.build, My_Strings.dep_Laboral[3], ContactsScreen(), boxSize),
        ],
      ),
    );
  }

  Widget _buildCategoryBox(BuildContext context, IconData icon, String text, Widget screen, double boxSize) {
    final iconSize = boxSize * 0.4;
    final fontSize = boxSize * 0.1;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize),
            SizedBox(height: 10.0),
            Text(
              text,
              style: TextStyle(fontSize: fontSize),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        width: boxSize,
        height: boxSize,
      ),
    );
  }
}
