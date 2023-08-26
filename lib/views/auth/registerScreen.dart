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
                var interface = api();
                interface.postrequest(
                    Uri.parse("http://" + server + "/api/register"), {
                  "username": username.text,
                  "email": email.text,
                  "password": password.text,
                  "confirm_password": confirm_password.text
                }).then((data) {
                  if (data.statusCode == 200) {
                    token = data.body;
                    Helpers.route(context, const HomeScreen());
                  } else {
                    Helpers.alert(context, data.body, 'Error');
                  }
                });
              },
              child: const Text('Register'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Login'))
          ],
        )
    );
  }
}
