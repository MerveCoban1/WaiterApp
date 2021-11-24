import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:waiter_app_demo/models/session_model.dart';

class AuthService {
  String url="https://api.digigarson.org/v1/";

  Future<SessionModel> loginUser(String email, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    SessionModel _sessionModel;
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
      pref.setString("email", email);
      Map<String, dynamic> map=json.decode(response.body);
      _sessionModel=SessionModel.fromJson(map);
      return _sessionModel;
    } else {
      return new SessionModel("Hata", response.body);
    }
  }
}