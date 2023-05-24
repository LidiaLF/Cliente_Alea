import 'package:cliente_alea/Values/My_Strings.dart';
import 'package:flutter/material.dart';

class BaixasITScreen extends StatefulWidget {
  @override
  _BaixasITScreenState createState() => _BaixasITScreenState();
}

class _BaixasITScreenState extends State<BaixasITScreen> {
  int _selectedIndex = -1; // índice del trabajador seleccionado

  final List<Map<String, dynamic>> workers = [
    {'name': 'Juan', 'date': '01/05/2023', 'type': 'Enfermedad Comun'},
    {
      'name': 'Pedro',
      'date': '02/05/2023',
      'type': 'Accidente Laboral',
      'endDate': '05/05/2023'
    },
    {
      'name': 'Maria',
      'date': '03/05/2023',
      'type': 'Enfermedad Profesional',
      'revision': '17/05/2023'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(My_Strings.dep_Laboral[1]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Mes Abril',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            workers.isEmpty
                ? Center(child: Text(My_Strings.noIT))
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: workers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final worker = workers[index];
                      final subtitle = worker['endDate'] != null
                          ? 'Data de baixa: ${worker['date']} \nData de alta: ${worker['endDate']}'
                          : 'Data de baixa: ${worker['date']}';

                      return Card(
                        child: ListTile(
                          title: Text(worker['name'],
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(subtitle),
                          trailing: Icon(Icons.note_alt_outlined),
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          worker['name'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                            'Data de baixa: ${worker['date']}'),
                                        if (worker['endDate'] != null) ...[
                                          SizedBox(height: 8),
                                          Text(
                                              'Data de alta: ${worker['endDate']}'),
                                        ],
                                        SizedBox(height: 8),
                                        Text(
                                            'Tipo de baixa: ${worker['type']}'),
                                        SizedBox(height: 8),
                                        if (worker['revision'] != null) ...[
                                          SizedBox(height: 8),
                                          Text(
                                              'Próxima revisión: ${worker['revision']}'),
                                        ],
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
