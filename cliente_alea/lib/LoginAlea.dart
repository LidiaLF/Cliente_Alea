import 'package:cliente_alea/Values/My_Colors.dart';
import 'package:cliente_alea/Values/My_Strings.dart';
import 'package:cliente_alea/Widgets/BackgroundStyle.dart';
import 'package:flutter/material.dart';

import 'UserHome.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Demo',
      theme: ThemeData(primaryColor: My_Colors.yellow_alea_dark),
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
            My_Strings.login,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            My_Strings.welcome,
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
  final TextEditingController _userController = TextEditingController();
  IconData icon = Icons.remove_red_eye_outlined;
  bool obs = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "images/alealogo.jpg",
            scale: 1.9,
          ),
          Text(My_Strings.user),
          SizedBox(),
          TextFormField(
            keyboardType: TextInputType.text,
            initialValue: _userController.text,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: My_Colors.yellow_alea_dark)),
                border: OutlineInputBorder()),
            onChanged: (value) {
              setState(() {
                _userController.text = value;
              });
            },
          ),
          SizedBox(),
          Text(My_Strings.pwd),
          SizedBox(),
          TextFormField(
            obscureText: obs,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: My_Colors.yellow_alea_dark)),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    icon,
                    color: My_Colors.yellow_alea_light,
                  ),
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
                )),
          ),
          Remember(),
          SizedBox(),
          Botons()
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
        Text(My_Strings.remember)
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
            backgroundColor:
                MaterialStateProperty.all<Color>(My_Colors.grey_dark)),
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
