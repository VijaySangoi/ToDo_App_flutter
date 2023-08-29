import 'package:flutter/material.dart';
import 'package:nothing_todo/vars/globals.dart';
import '../../utilities/Helpers.dart';
import '../../controllers/api.dart';
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
  Widget build(BuildContext context) {
    var interface = api();
    interface.getrequest(
        Uri.parse("http://" + server + "/api/task"),
        {"Authorization":"Bearer "+token},
        {}
    ).then((data){
      print(data.body);
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Nothing-todo'),
      ),
      drawer: Helpers.sidebar(context),
      body: Center()
    );
  }
}
