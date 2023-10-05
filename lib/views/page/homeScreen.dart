import 'package:flutter/material.dart';
import 'package:nothing_todo/vars/globals.dart';
import '../../utilities/Helpers.dart';
import '../../controllers/api.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Nothing-todo'),
      ),
      drawer: Helpers.sidebar(context),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            child: Text('yet to build'),
          );
        },
      )
    );
  }
}
