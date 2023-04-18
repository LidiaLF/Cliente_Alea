import 'package:cliente_alea/values/My_Strings.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class UserSettings extends StatefulWidget {
  UserSettings({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(My_Strings.configUser),
            tiles: [
            ],
          ),
          SettingsSection(
            title: Text(My_Strings.configApp),
            tiles: [
              SettingsTile(
                title: Text(My_Strings.lang),
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: Text(My_Strings.safety),
                leading: Icon(Icons.lock),
                onPressed: (BuildContext context) {

                },
              ),
            /*  SettingsTile.switchTile(
                title: Text(My_Strings.fingerprint),
                leading: Icon(Icons.fingerprint),
                enabled: true,
                onToggle: (value) {},
                initialValue: true,
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}
