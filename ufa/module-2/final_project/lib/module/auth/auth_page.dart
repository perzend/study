import 'package:final_project/routes/routes.dart';
import 'package:final_project/services/secure_storage.dart';
import 'package:flutter/material.dart';

// class AuthPage extends StatefulWidget {
//   AuthPage(
//       {Key? key,
//       required this.phone,
//       required this.pwd})
//       : super(key: key);
//   static const String routeName = '/authPage';
//
//   String? phone;
//   final String? pwd;

class AuthPage extends StatefulWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/authPage';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController _phoneController;
  late TextEditingController _pwdController;

  final SecureStorage _secureStorage = SecureStorage();

  bool _errorPhoneValidate = false;
  bool _errorPwdValidate = false;
  bool _loginButtonEnabled = false;
  bool _colorButton = false;

  String? _phone;
  String? _pwd;

  @override
  void initState() {
    _getPhone();
    _getPwd();
    _phoneController = TextEditingController();
    _pwdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  Future _getPhone() async {
    _phone = await _secureStorage.readSecureData('phone');
  }

  Future _getPwd() async {
    _pwd = await _secureStorage.readSecureData('pwd');
  }

  bool _checkTextOnChanged(String text, int count) {
    if (text.length < count) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back4.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    'Please, log in\nor register',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _phoneController,
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        prefixText: '+7 ',
                        labelText: 'Type a phone number',
                        labelStyle: TextStyle(fontSize: 16.0, letterSpacing: 1),
                        errorText: _errorPhoneValidate
                            ? 'Must be at least 10 digits'
                            : null,
                        errorStyle: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      maxLength: 10,
                      onChanged: (text) {
                        setState(() {
                          _colorButton = false;
                          _loginButtonEnabled = false;
                        });
                      },
                      onSubmitted: (text) {
                        setState(() {
                          _errorPhoneValidate = _checkTextOnChanged(text, 10);

                          _colorButton = false;
                          _loginButtonEnabled = false;
//
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _pwdController,
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        labelText: 'Type a password',
                        labelStyle: TextStyle(fontSize: 16.0, letterSpacing: 1),
                        errorText: _errorPwdValidate
                            ? 'Must be at least 6 digits'
                            : null,
                        errorStyle: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      obscuringCharacter: '*',
                      onChanged: (text) {
                        setState(() {
                          _colorButton = false;
                          _loginButtonEnabled = false;
                        });
                      },
                      onSubmitted: (text) {
                        setState(() {
                          _errorPwdValidate = _checkTextOnChanged(text, 6);
                          if (_phoneController.text.length == 10 &&
                              _pwdController.text.length > 5) {
                            _colorButton = true;
                            _loginButtonEnabled = true;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 8.0),
                          child: ElevatedButton(
                            style: _colorButton
                                ? ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue))
                                : ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey)),
                            onPressed: () {
                              if (_loginButtonEnabled) {
                                print(_phoneController.text);
                                print(_phone);
                                print(_pwdController.text);
                                print(_pwd);

                                if (_phoneController.text != _phone) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Login error!',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                          content: Text(
                                            'The phone number is entered incorrectly or does not exist. Please try again.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('OK'))
                                          ],
                                        );
                                      });
                                } else {
                                  if (_pwdController.text != _pwd) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Password error!',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5),
                                            content: Text(
                                              'Invalid password entered. Please try again.',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('OK'))
                                            ],
                                          );
                                        });
                                  } else {
                                    _secureStorage.writeSecureData(
                                        'login_status', 'isOK');
                                    Navigator.pushReplacementNamed(
                                        context, Routes.usersList);
                                  }
                                }
                              } else {
                                null;
                              }
                            },
                            child: Text('Login'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 16.0),
                          child: ElevatedButton(
                            style: _phone != null
                                ? ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.grey))
                                : ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue)),
                            onPressed: () {
                              if (_phone != null) {
                                null;
                              } else {
                                if (_phoneController.text.length == 10 &&
                                    _pwdController.text.length > 5) {
                                  _secureStorage.writeSecureData(
                                      'phone', _phoneController.text);
                                  _secureStorage.writeSecureData(
                                      'pwd', _pwdController.text);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              'Registration was successful!',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                          content: Text(
                                            'Now you will be redirected to the main page of the application.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  _secureStorage
                                                      .writeSecureData(
                                                          'login_status',
                                                          'isOK');
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context,
                                                          Routes.usersList);
                                                },
                                                child: const Text('OK'))
                                          ],
                                        );
                                      });
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Registration failed!',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5),
                                          content: Text(
                                            'Check your registration data.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('OK'))
                                          ],
                                        );
                                      });
                                }
                              }
                            },
                            child: Text('Register'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _demoModeAlert(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  // Выводит соответствующую надпись, если пользователь уже создан или ничего, если не создан
  Widget _demoModeAlert() {
    return _phone != null
        ? const Text(
            'Only one user in demo mode',
            style: TextStyle(
                fontSize: 12.0, color: Colors.red, fontWeight: FontWeight.bold),
          )
        : const Text('');
  }
}
