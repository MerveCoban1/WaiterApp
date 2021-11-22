import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:waiter_app_demo/models/session.dart';

class AuthService {
  String url="https://api.digigarson.org/v1/";

  Future<Session> loginUser(String email, String password) async {
    Session _session;
    String path=url+"waiter/signin";

    final http.Response response = await http.post(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map=json.decode(response.body);
      _session=Session.fromJson(map);
      return _session;
    } else {
      return new Session("Hata", response.body);
    }
  }
}