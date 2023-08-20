import 'dart:convert';
import 'package:http/http.dart' as http;

class api{
  Future<http.Response> postrequest(url,data) async{
    var response = await http.post(
        url,
        body:jsonEncode(data)
    );
    return response;
  }
}