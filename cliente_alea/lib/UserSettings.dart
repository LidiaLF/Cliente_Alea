import 'package:cliente_alea/LateralMenu.dart';
import 'package:cliente_alea/Values/My_Colors.dart';
import 'package:cliente_alea/Values/My_Strings.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:settings_ui/settings_ui.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  bool isSwitched = false;
  String selectedLanguage = My_Strings.gl;
  String email = '';
  String phoneNumber = '';
  String oldPassword = 'Abc1.';
  String currentPassword = '';
  String newPassword = '';
  TextEditingController emailController = TextEditingController();
  bool isEmailValid = true;
  String newEmail = '';
  String currentCountry = 'ES';
  String currentPhone = '';
  bool isEmailEditing = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LateralMenu(),
      appBar: AppBar(
        title: Text(My_Strings.config),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text(
              My_Strings.configUser,
              style: TextStyle(color: My_Colors.yellow_alea_dark),
            ),
            tiles: [
              SettingsTile(
                title: Text(My_Strings.email),
                description: TextFormField(
                  initialValue: email,
                  onTap: () {
                    setState(() {
                      isEmailEditing = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      newEmail = value;
                      isEmailValid = _isValidEmail(value);
                    });
                  },
                  decoration: InputDecoration(
                    hintText: email,
                    errorText: isEmailValid ? null : 'Email no válido',
                    focusedBorder: isEmailEditing
                        ? UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          )
                        : UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                  ),
                ),
                leading: Icon(Icons.email),
                onPressed: (BuildContext context) {
                  setState(() {
                    isEmailValid = true;
                  });
                },
              ),
              SettingsTile(
                title: Text(My_Strings.tlf),
                leading: Icon(Icons.phone),
                description: Text(currentPhone),
                onPressed: (BuildContext context) {
                  _showChangePhoneNumberDialog();
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text(My_Strings.configApp,
                style: TextStyle(color: My_Colors.yellow_alea_dark)),
            tiles: [
              SettingsTile(
                title: Text(My_Strings.pwd),
                leading: Icon(Icons.lock),
                onPressed: (BuildContext context) {
                  _showChangePasswordDialog();
                },
              ),
              SettingsTile(
                title: Row(
                  children: [
                    Text('Lingua'),
                    SizedBox(width: 50), // Espacio horizontal
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedLanguage,
                          items: <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                              value: My_Strings.gl,
                              child: Text(My_Strings.gl),
                            ),
                            DropdownMenuItem<String>(
                              value: My_Strings.es,
                              child: Text(My_Strings.es),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                leading: Icon(Icons.language),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog() {
    isPasswordVisible = false;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Contraseña actual'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    obscureText: !isPasswordVisible,
                    onChanged: (value) {
                      currentPassword = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Contraseña actual',
                      suffixIcon: IconButton(
                        icon: Icon(!isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(My_Strings.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_isValidPassword(currentPassword)) {
                      Navigator.pop(context);
                      _showNewPasswordDialog();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Contraseña actual incorrecta.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(My_Strings.accept),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(My_Strings.accept),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showNewPasswordDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Introduce nueva contraseña'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    obscureText: !isPasswordVisible,
                    onChanged: (value) {
                      newPassword = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nueva Contraseña',
                      suffixIcon: IconButton(
                        icon: Icon(!isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(My_Strings.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_isValidNewPassword(newPassword)) {
                      Navigator.pop(context);
                      _saveNewPassword(newPassword);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'La nueva contraseña no cumple con los requisitos.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(My_Strings.accept),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(My_Strings.accept),
                ),
              ],
            );
          },
        );
      },
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void _saveNewPassword(String newPassword) {
    setState(() {
      oldPassword = newPassword;
    });
  }

  bool _isValidPassword(String password) {
    if (oldPassword == password) return true;
    return false;
  }

  bool _isValidNewPassword(String password) {
    return password.length >= 6 &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  void _showChangePhoneNumberDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String selectedCountryCode = "+1"; // Código de país seleccionado inicialmente

        return AlertDialog(
          title: Text('Teléfono de contacto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CountryCodePicker(
                      onChanged: (CountryCode? countryCode) {
                        if (countryCode != null) {
                          selectedCountryCode = countryCode.dialCode!;
                        }
                      },
                      initialSelection: currentCountry,
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: true,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: 'Número de teléfono',
                      ),
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_isValidPhoneNumber(selectedCountryCode, phoneNumber)) {
                  Navigator.pop(context);
                  _saveNewPhoneNumber(selectedCountryCode, phoneNumber);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Número de teléfono no válido.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }


  void _saveNewPhoneNumber(String country, String newPhoneNumber) {
    setState(() {
      currentCountry = country;
      currentPhone = newPhoneNumber;
    });
  }

  bool _isValidPhoneNumber(String phoneNumber, String country) {
    // Implementar la lógica para validar el número de teléfono según el país seleccionado
    if (phoneNumber.isEmpty) {
      return true; // Permite dejar el campo en blanco
    } else if (country == 'Spain') {
      // Validar número de teléfono en España
      // Implementar la lógica específica para España
      // Ejemplo: Comprobar que tiene 9 dígitos
      return phoneNumber.length == 9;
    } else if (country == 'United States') {
      // Validar número de teléfono en Estados Unidos
      // Implementar la lógica específica para Estados Unidos
      // Ejemplo: Comprobar que tiene 10 dígitos
      return phoneNumber.length == 10;
    } else {
      // Implementar la lógica para otros países
      return true;
    }
  }
}
