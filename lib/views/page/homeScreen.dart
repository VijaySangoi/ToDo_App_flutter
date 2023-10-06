import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nothing_todo/vars/globals.dart';
import '../../utilities/Helpers.dart';
import '../../controllers/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  var interface = api();
  var data;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    render();
  }

  render() async {
    var url = "http://" + server + "/api/task/0";
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Nothing-todo'),
      ),
      drawer: Helpers.sidebar(context),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green)),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data![index]['task'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
