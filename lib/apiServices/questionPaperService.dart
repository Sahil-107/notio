import 'dart:convert';
import 'package:http/http.dart' as http;
import '../keys.dart';

class questionPaperService {
  getSubjects(Object object) async {
    return await http.post(Uri.parse("${api_url}/notes/getSubjects"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(object));
  }

  getQuestionPapers(Object object) async {
    return await http.post(Uri.parse("${api_url}/questionpapers/fetch"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(object));
  }
}
