import 'package:flutter/material.dart';
import '../../utilities/Helpers.dart';
import '../../controllers/api.dart';
import '../../vars/globals.dart';
import '../page/homeScreen.dart';
import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var interface = api();
  bool _login_var = false;

  register(username, email, password, confirm_password) async {
    var url = "http://" + server + "/api/register";
    const head = {"content-type": "application/json"};
    var bod = {
      "username": username,
      "password": password,
      "email": email,
      "confirm_password": confirm_password
    };
    String response = await interface.postrequest(url, head, bod);
    if (response != "false") {
      token = response;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final username = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    final confirm_password = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Nothing-todo'),
      ),
      body: body(username, password, email, confirm_password),
    );
  }

  Widget body(username, password, email, confirm_password) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Helpers.input('Username', username, false),
          Helpers.input('email', email, false),
          Helpers.input('Password', password, true),
          Helpers.input('Confirm Password', confirm_password, true),
          TextButton(
            onPressed: () {
              _login_var = true;
              register(username.text, password.text, email.text,
                  confirm_password.text);
            },
            child: const Text('Register'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
