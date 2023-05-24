import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

//import 'My_Strings.dart';


class MyLocalizations {
  MyLocalizations(this.locale);

  final Locale locale;

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hello': 'Hello',
      'welcome': 'Welcome',
      //agrega aquí todas las cadenas traducibles en inglés
    },
    'es': {
      'hello': 'Hola',
      'welcome': 'Bienvenido',
      //agrega aquí todas las cadenas traducibles en español
    },
    //Agrega aquí los demás idiomas
  };

  static MyLocalizations? of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String get hello {
    return _localizedValues[locale.languageCode]!['hello']!;
  }

  String get welcome {
    return _localizedValues[locale.languageCode]!['welcome']!;
  }

//agrega aquí los getters para las demás cadenas de texto

}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>(MyLocalizations(locale));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
