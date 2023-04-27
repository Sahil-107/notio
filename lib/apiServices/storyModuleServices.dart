import 'dart:convert';

import 'package:http/http.dart' as http;

class storyServices {
<<<<<<< HEAD
  String _api_url =
      "http://ec2-43-204-30-204.ap-south-1.compute.amazonaws.com:8080";

  //  String _api_url =
=======
  String _api_url = "http://ec2-43-204-30-204.ap-south-1.compute.amazonaws.com:8080";

  // String _api_url =
>>>>>>> 9736a052048bf1898b1afb07d5d88ed5612259f3
  //     "http://192.168.1.2:8080";

  getStroiesapi(Object body) async {
    return await http.post(Uri.parse("$_api_url/userStory/getStories"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }

  addBolt(Object body) async {
    return await http.post(Uri.parse("$_api_url/userStory/addBolt"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }

  addView(Object body) async {
    return await http.post(Uri.parse("$_api_url/userStory/addView"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }
}
