import 'dart:convert';

import 'package:http/http.dart' as http;

class storyServices {
  String _api_url = "http://192.168.1.7:8080";

  getStroiesapi(Object body) async {
    return await http.post(
        Uri.parse("$_api_url/userStory/getStories"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }
}
