import 'package:flutter/material.dart';
import '../../controllers/api.dart';

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
                Navigator.of(context).pop();
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
}
