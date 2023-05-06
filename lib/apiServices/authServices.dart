import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notio/keys.dart';

class authServices {
  generateToken(String key) async {
    return await http.get(Uri.parse("${api_url}/token/generate/$key"));
  }

  registerUser(Object newUser) async {
    // print(newUser);
    return await http.post(Uri.parse("${api_url}/auth/registerUser"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(newUser));
  }

  onBoardUser(Object newUser) async {
    return await http.post(Uri.parse("${api_url}/auth/onBoardUser"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(newUser));
  }

  getUserData(Object user) async {
    return await http.post(Uri.parse("${api_url}/auth/getUserData"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user));
  }

  loginUser(Object user) async {
    return await http.post(Uri.parse("${api_url}/auth/login"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user));
  }
}
