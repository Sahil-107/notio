import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:notio/keys.dart';


class appServices{
   getSubjects(Object object) async {
    return await http.post(Uri.parse("${api_url}/notes/getSubjects"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(object));
  }
}