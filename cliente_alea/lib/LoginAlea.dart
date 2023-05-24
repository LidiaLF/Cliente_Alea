import 'package:cliente_alea/Values/My_Strings.dart';
import 'package:cliente_alea/values/My_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cliente_alea/localization/my_localizations_delegate.dart';

import 'UserHome.dart';
import 'Widgets/BackgroundStyle.dart';

class MyApp extends StatelessWidget {
  final Color myColor = My_Colors.yellow_alea_dark;
  Locale _locale = Locale('gl', ''); // idioma por defecto (Galego)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(
          myColor.value,
          {
            50: myColor.withOpacity(0.1),
            100: myColor.withOpacity(0.2),
            200: myColor.withOpacity(0.3),
            300: myColor.withOpacity(0.4),
            400: myColor.withOpacity(0.5),
            500: myColor.withOpacity(0.6),
            600: myColor.withOpacity(0.7),
            700: myColor.withOpacity(0.8),
            800: myColor.withOpacity(0.9),
            900: myColor.withOpacity(1.0),
          },
        ),
      ),
      home: LoginAlea(),
    );
  }
}

class LoginAlea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackground(),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            My_Strings.login,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            My_Strings.welcome,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Datos(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Datos extends StatefulWidget {
  @override
  _DatosState createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  final TextEditingController _userController = TextEditingController();
  IconData icon = Icons.remove_red_eye_outlined;
  bool obs = true;

  @override
  Widget build(BuildContext context) {
   // final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         // if (screenWidth >= 400)
            Image.asset(
              "images/alealogo.jpg",
              width: 600.0,
              height: 200.0,
              fit: BoxFit.scaleDown,
            ),
          Text(My_Strings.user),
          SizedBox(height: 5),
          TextFormField(
            keyboardType: TextInputType.text,
            initialValue: _userController.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: My_Colors.yellow_alea_dark),
              ),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _userController.text = value;
              });
            },
          ),
          SizedBox(height: 20),
          Text(My_Strings.pwd),
          SizedBox(height: 5),
          TextFormField(
            obscureText: obs,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: My_Colors.yellow_alea_dark),
              ),
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(icon),
                onPressed: () {
                  setState(() {
                    obs = !obs;
                    if (obs == true) {
                      icon = Icons.remove_red_eye_outlined;
                    } else {
                      icon = Icons.remove_red_eye;
                    }
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Remember(),
          SizedBox(height: 20),
          Botons(),
        ],
      ),
    );
  }
}

class Remember extends StatefulWidget {
  @override
  _RememberState createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: remember,
          onChanged: (value) {
            setState(() {
              remember = value!;
            });
          },
        ),
        Text(My_Strings.remember),
      ],
    );
  }
}

class Botons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UserHome()),
          );
        },
        child: Text(
          My_Strings.login,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            My_Colors.grey_dark,
          ),
        ),
      ),
    );
  }
}

class LoginBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getBgGradient();
  }
}
