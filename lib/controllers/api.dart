import 'dart:convert';
import 'package:http/http.dart' as http;

class api {
  var client = http.Client();
  Future<String> postrequest(url, header, data) async {
    var uri = Uri.parse(url);
    var response =
        await client.post(uri, headers: header, body: jsonEncode(data));
    if (response.statusCode == 200) {
      final body = response.body;
      return Future.value(body);
    }
    return "false";
  }

  Future<String> getrequest(url, header) async {
    var uri = Uri.parse(url);
    var response = await client.get(uri, headers: header);
    if (response.statusCode == 200) {
      final body = response.body;
      return Future.value(body);
    }
    return "false";
  }

  Future<String> putrequest(url, header, data) async {
    var uri = Uri.parse(url);
    var response =
        await client.put(uri, headers: header, body: jsonEncode(data));
    if (response.statusCode == 200) {
      final body = response.body;
      return Future.value(body);
    }
    return "false";
  }

  Future<String> deleterequest(url, header, data) async {
    var uri = Uri.parse(url);
    var response =
        await client.delete(uri, headers: header, body: jsonEncode(data));
    if (response.statusCode == 200) {
      final body = response.body;
      return Future.value(body);
    }
    return "false";
  }
}
