import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:notio/keys.dart';

class storyServices {
  uploadStory(File file, Object data) async {
    http.MultipartRequest req = http.MultipartRequest(
      'POST',
      Uri.parse("$api_url/userStory/addStory"),
    );

    req.files.add(await http.MultipartFile.fromPath("image", file.path));

    final jsonPart = http.MultipartFile.fromString('data', json.encode(data),
        contentType: MediaType('application', 'json'));
    req.files.add(jsonPart);
    return await req.send();
  }

  getStroiesapi(Object body) async {
    return await http.post(Uri.parse("$api_url/userStory/getStories"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }

  getCurUserStories(Object body) async
  {
    return await http.post(Uri.parse("$api_url/userStory/getCurUserStories"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }

  addBolt(Object body) async {
    return await http.post(Uri.parse("$api_url/userStory/addBolt"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }

  addView(Object body) async {
    return await http.post(Uri.parse("$api_url/userStory/addView"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }
}
