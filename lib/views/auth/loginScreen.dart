import 'package:flutter/material.dart';
import '../../utilities/Helpers.dart';
import '../../controllers/api.dart';
import '../../vars/globals.dart';
import '../page/homeScreen.dart';
import 'registerScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final username = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Nothing-todo'),
      ),
      body: body(username, password),
    );
  }

  Widget body(username, password) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 130),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Helpers.input('Username', username, false),
            Helpers.input('Password', password, true),
            TextButton(
              onPressed: () {
                var interface = api();
                interface.postrequest(
                  Uri.parse("http://" + server + "/api/login"),
                  {},
                  {
                    "username": username.text,
                    "password": password.text
                  }).then((data) {
                  if (data.statusCode == 200) {
                    token = data.body;
                    Helpers.route(context, const HomeScreen());
                  } else {
                    Helpers.alert(context, data.body, 'Error');
                  }
                });
              },
              child: const Text('Login'),
            ),
            TextButton(
                onPressed: () {
                  Helpers.route(context, const RegisterScreen());
                },
                child: const Text('Register'))
          ],
        )
    );
  }
}
