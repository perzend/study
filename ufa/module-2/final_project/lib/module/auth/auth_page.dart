import 'package:final_project/routes/routes.dart';
import 'package:final_project/services/secure_storage.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key, required this.phone, required this.pwd}) : super(key: key);
  static const String routeName = '/authPage';

  final String? phone;
  final String? pwd;

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController _phoneController;
  late TextEditingController _pwdController;

  final SecureStorage _secureStorage = SecureStorage();


  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please, log in\nor register',
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Type a phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              keyboardType: TextInputType.phone,
              maxLength: 11,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _pwdController,
              decoration: InputDecoration(
                labelText: 'Type a password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              obscuringCharacter: '*',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print(_phoneController.text);
                      print(widget.phone);
                      print(_pwdController.text);
                      print(widget.pwd);
                      if (_phoneController.text == widget.phone &&
                          _pwdController.text == widget.pwd) {
                        _secureStorage.writeSecureData('login_status', 'isOK');
                        Navigator.pushReplacementNamed(
                            context, Routes.usersList);
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Login error!',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                content: Text(
                                  'The phone number or password is entered incorrectly or does not exist. Please try again.',
                                  style: Theme.of(context).textTheme.bodyText1,
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
                    },
                    child: Text('Login'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_phoneController.text == widget.phone) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Registration failed!',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                content: Text(
                                  'This phone number already use.',
                                  style: Theme.of(context).textTheme.bodyText1,
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
                            'phone', _phoneController.text);
                        _secureStorage.writeSecureData(
                            'pwd', _pwdController.text);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Registration was successful!',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                content: Text(
                                  'Now you will be redirected to the main page of the application.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        _secureStorage.writeSecureData(
                                            'login_status', 'isOK');
                                        Navigator.pushReplacementNamed(
                                            context, Routes.usersList);
                                      },
                                      child: const Text('OK'))
                                ],
                              );
                            });
                      }
                    },
                    child: Text('Register'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
