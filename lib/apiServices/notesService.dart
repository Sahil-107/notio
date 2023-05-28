import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notio/keys.dart';

class notesServices {
  getSubjects(Object object) async {
    return await http.post(Uri.parse("${api_url}/notes/getSubjects"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(object));
        
  }
}
