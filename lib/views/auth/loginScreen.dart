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
  var interface = api();
  bool _login_var = false;

  login(username, password) async {
    var url = "http://" + server + "/api/login";
    const head = {"content-type": "application/json"};
    var bod = {"username": username, "password": password};
    String response = await interface.postrequest(url, head, bod);
    print(response);
    if (response != "failed") {
      token = response;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

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
                setState(() {
                  _login_var = true;
                  login(username.text, password.text);
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
        ));
  }
}
