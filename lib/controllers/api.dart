import 'dart:convert';
import 'package:http/http.dart' as http;

class api {
  Future<http.Response> postrequest(url, header, data) async {
    var response = await http.post(url, headers: header, body: jsonEncode(data));
    return response;
  }
  Future<http.Response> getrequest(url, header, data) async {
    var response = await http.get(url, headers: header);
    return response;
  }
}
