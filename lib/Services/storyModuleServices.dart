import 'dart:convert';

import 'package:http/http.dart' as http;

class storyServices {
  getStroiesapi(sem) async {
    return await http.post(Uri.parse("http://192.168.1.7:8080/userStory/getStories"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "id": 237642,
          "sem": sem,
          "college": "UIT",
          "university": "HPU",
          "branch": "CSE"
        }));
  }
}
