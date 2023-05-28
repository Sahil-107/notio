import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notio/keys.dart';

class creatorServices {
  onBoardCreator(Object object) async {
    return await http.post(Uri.parse("${api_url}/creator/onBoardCreator"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(object));
  }
}
