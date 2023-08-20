import 'dart:convert';

import 'package:flutter/material.dart';
import '../../utilities/Helpers.dart';
import '../../controllers/api.dart';
import '../../vars/globals.dart';
import 'package:http/http.dart';

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
      body:body(username,password),
    );
  }
  Widget body(username,password)
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 130),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Helpers.input('Username',username,false),
          Helpers.input('Password',password,true),
        TextButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(150,40)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: (){
            var interface = api();
            interface.postrequest(
              Uri.parse("http://192.168.10.12:8000/api/login"),
              {"username": username.text, "password": password.text}
            ).then((data){
              token = data.body;
            });
          },
          child: const Text('Login'),
        ),
       ],
      )
    );
  }
}
