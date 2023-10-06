import 'package:flutter/material.dart';
import '../views/page/completedScreen.dart';
import '../views/page/homeScreen.dart';

class Helpers {
  static input(text, con, obscure) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: text,
        ),
        obscureText: obscure,
        controller: con,
      ),
    );
  }

  static alert(context, message, head) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(head),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static route(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static sidebar(context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child:CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 120,
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const HomeScreen())
                );
              },
            ),
            ListTile(
              title: const Text('Completed'),
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const CompletedScreen())
                );
              },
            )
          ],
        )
    );
  }
}
