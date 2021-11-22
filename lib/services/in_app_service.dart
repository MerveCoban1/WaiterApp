import 'dart:convert';
import 'package:http/http.dart' as http;

class InAppService {
  String url="https://api.digigarson.org/v1/";

  Future<List> fetchDataAllSections(String refreshToken,String accessToken) async {
    String path=url+"waiter/sections";

    final http.Response response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-refresh' : refreshToken,
        'Authorization' : 'Bearer '+ accessToken,
      },
    );
    if (response.statusCode == 200) {
      var _sectionList=json.decode(response.body);
      return _sectionList;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.body}",
      );
    }
  }

  Future<List> fetchTableBySectionId(String refreshToken,String accessToken,String sectionId) async {
    print("gelensectionId");
    print(sectionId);

    String path=url+"waiter/sections/"+"61714c2322b06713dc4650cb";

    final http.Response response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-refresh' : refreshToken,
        'Authorization' : 'Bearer '+ accessToken,
      },
    );
    if (response.statusCode == 200) {
      var tablesList=json.decode(response.body)['tables'];
      return tablesList;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.body}",
      );
    }
  }

}