import 'package:flutter/material.dart';
import 'views/auth/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login ui",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.amberAccent,
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(150, 40)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
          )),
      home: LoginScreen(),
    );
  }
}
