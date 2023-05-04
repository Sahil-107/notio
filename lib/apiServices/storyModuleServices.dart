import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class storyServices {
  // String _api_url =
  //     "http://ec2-43-204-30-204.ap-south-1.compute.amazonaws.com:8080";

  // String _api_url = "http://192.168.1.2:8080";
  String _api_url = "http://3.109.45.59:8080";

  uploadStory(File file, Object data) async {
    http.MultipartRequest req = http.MultipartRequest(
      'POST',
      Uri.parse("$_api_url/userStory/addStory"),
    );

    req.files.add(await http.MultipartFile.fromPath("image", file.path));

    final jsonPart = http.MultipartFile.fromString('data', json.encode(data),
        contentType: MediaType('application', 'json'));
    req.files.add(jsonPart);
    return await req.send();
  }

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
