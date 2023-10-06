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

  done(id, body) async {
    var url = "http://" + server + "/api/task/" + id;
    var head = {
      "content-type": "application/json",
      "Authorization": "Bearer " + token
    };
    String response = await interface.putrequest(url, head, body);
    if (response != "false") {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CompletedScreen()),
      );
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
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data![index]['task'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        var id = data![index]['id'].toString();
                        var task = data![index]['task'];
                        var body = {"task": task, "is_completed": "0"};
                        done(id, body);
                      },
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
