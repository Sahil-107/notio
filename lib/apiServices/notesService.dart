import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:notio/keys.dart';

class notesServices {
  getSubjects(Object object) async {
    return await http.post(Uri.parse("${api_url}/notes/getSubjects"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(object));
  }

  uploadNote(File file, Object data) async {
    http.MultipartRequest req = http.MultipartRequest(
      'POST',
      Uri.parse("$api_url/notes/upload"),
    );
    req.files.add(await http.MultipartFile.fromPath("note", file.path));
    final jsonPart = http.MultipartFile.fromString('data', json.encode(data),
        contentType: MediaType('application', 'json'));
    req.files.add(jsonPart);
    return await req.send();
  }
}
