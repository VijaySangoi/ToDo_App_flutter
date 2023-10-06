import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nothing_todo/vars/globals.dart';
import '../../utilities/Helpers.dart';
import '../../controllers/api.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  var interface = api();
  var data;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    render();
  }

  render() async {
    var url = "http://" + server + "/api/task/1";
    var head = {
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    };
    String response = await interface.getrequest(url, head);
    if (response != "false") {
      setState(() => {isLoaded = true});
      data = json.decode(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
