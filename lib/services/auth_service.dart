import 'package:http/http.dart' as http;
import 'package:waiter_app_demo/database/dbHelper.dart';
import 'dart:convert';
import 'package:waiter_app_demo/models/session_model.dart';

class AuthService {
  String url="https://api.digigarson.org/v1/";
  var dbHelper=DbHelper();
  Future<SessionModel> loginUser(String email, String password) async {
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
      Map<String, dynamic> map=json.decode(response.body);
      _sessionModel=SessionModel.fromJson(map);
      dbHelper.insert(_sessionModel).then((value) => {
        print("veritabanına ekleme sonucu"),
        print(value),
      });
      return _sessionModel;
    } else {
      return new SessionModel("Hata", response.body);
    }
  }
}