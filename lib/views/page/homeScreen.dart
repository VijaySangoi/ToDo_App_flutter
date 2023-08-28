import 'package:flutter/material.dart';
import '../../utilities/Helpers.dart';
import 'getTask.dart';
import 'postTask.dart';
import 'putTask.dart';
import 'deleteTask.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  var options = [
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Nothing-todo'),
      ),
      drawer: Helpers.sidebar(context,options),
      body: Center(),
    );
  }
}
