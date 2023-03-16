import 'package:cliente_alea/Values/Strings.dart';
import 'package:cliente_alea/Widgets/BackgroundStyle.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      home: LoginAlea(),
    );
  }
}

class LoginAlea extends StatefulWidget {
  @override
  _LoginAleaState createState() => _LoginAleaState();
}

class _LoginAleaState extends State<LoginAlea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [LoginBackground(), LoginLabel()],
    ));
  }
}

class LoginLabel extends StatefulWidget {
  @override
  _LoginLabelState createState() => _LoginLabelState();
}

class _LoginLabelState extends State<LoginLabel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.login,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            Strings.welcome,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Datos(),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("images/alealogo.jpg"),
          Text("nombre"),
          SizedBox(),
          TextFormField(),
          SizedBox(),
          Text("pwd"),
          SizedBox(),
          TextFormField(),
          //Remember(),
          SizedBox(),
          Botons()
        ],
      ),
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
        onPressed: () {},
        child: Text(
          Strings.login,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 81, 86, 92))),
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
