import 'dart:async';
import 'package:cliente_alea/Values/My_Strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListNewsWidget extends StatefulWidget {
  @override
  _ListNewsWidgetState createState() => _ListNewsWidgetState();
}

class _ListNewsWidgetState extends State<ListNewsWidget> {
  List<dynamic> newsList = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Inicializar la lista de noticias
    _fetchNews();

    // Configurar el timer para actualizar las noticias cada 15 minutos
    timer = Timer.periodic(Duration(minutes: 15), (_) => _fetchNews());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchNews() async {
    // Aquí deberías hacer una llamada a una API o a un servicio que te proporcione las noticias
    // Por ahora, vamos a utilizar una lista de noticias de ejemplo
    List<dynamic> fetchedNewsList = [
      {
        "title": "Novedad de Firebase",
        "message": "Mensaje de ejemplo de Firebase",
        "type": "firebase"
      },
      {
        "title": "Novedad del BOE",
        "message": "Mensaje de ejemplo del BOE",
        "url": "https://www.boe.es/",
        "type": "boe"
      }
    ];

    setState(() {
      newsList = fetchedNewsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: newsList.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, size: 48, color: Colors.grey[500]),
          Text(My_Strings.noNews,
              style: TextStyle(fontSize: 18, color: Colors.grey[500])),
        ],
      )
          : ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (BuildContext context, int index) {
          final news = newsList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: news["type"] == "firebase"
                    ? Colors.redAccent
                    : Colors.grey.shade400,
                width: 2,
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: InkWell(
              onTap: news["type"] == "firebase"
                  ? null
                  : () => launch(news["url"]),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news["title"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(news["message"]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
