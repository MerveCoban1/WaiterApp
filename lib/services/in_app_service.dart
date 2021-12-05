import 'dart:convert';
import 'package:http/http.dart' as http;

class InAppService {
  String url = "https://api.digigarson.org/v1/";

  Future<List> getAllSections(String refreshToken, String accessToken) async {
    String path = url + "waiter/sections";

    final http.Response response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-refresh': refreshToken,
        'Authorization': 'Bearer ' + accessToken,
      },
    );
    if (response.statusCode == 200) {
      var _sectionList = json.decode(response.body);
      return _sectionList;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.body}",
      );
    }
  }

  Future<List> getTablesBySectionId(
      String refreshToken, String accessToken, String sectionId) async {
    String path = url +
        "waiter/sections/" +
        "61714c2322b06713dc4650cb"; //buraya sectionId yazılacak

    final http.Response response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-refresh': refreshToken,
        'Authorization': 'Bearer ' + accessToken,
      },
    );
    if (response.statusCode == 200) {
      var tablesList = json.decode(response.body)['tables'];
      return tablesList;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.body}",
      );
    }
  }

  Future<List> getAllCategory(String refreshToken, String accessToken) async {
    String path = url + "waiter/category";

    final http.Response response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-refresh': refreshToken,
        'Authorization': 'Bearer ' + accessToken,
      },
    );
    if (response.statusCode == 200) {
      var _categoryList = json.decode(response.body);
      return _categoryList;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.body}",
      );
    }
  }

  Future<List> getProductsByCategoryId(
      String refreshToken, String accessToken, String categoryId) async {
    String path = url + "waiter/category/" + categoryId;
    final http.Response response = await http.get(
      Uri.parse(path),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-refresh': refreshToken,
        'Authorization': 'Bearer ' + accessToken,
      },
    );
    if (response.statusCode == 200) {
      var productsList = json.decode(response.body)['products'];
      return productsList;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.body}",
      );
    }
  }

  Future<List> getOrders(
      String refreshToken, String accessToken, String tableId) async {
    final http.Response response = await http.get(
      Uri.parse('${url}waiter/orders/${tableId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-refresh': refreshToken,
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      var ordersList = json.decode(response.body)['orders'];
      return ordersList;
    } else {
      throw Exception("İstek durumu başarısız oldu: ${response.reasonPhrase}");
    }
  }

  Future<void> deleteOrders(String refreshToken, String accessToken,
      String tableId, String ordersId, String productId, int quantity) async {
    var headers = {
      'x-refresh': '${refreshToken}',
      'Authorization': 'Bearer ${accessToken}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'DELETE',
        Uri.parse(
            'https://api.digigarson.org/v1/waiter/orders/${tableId}/${ordersId}'));
    request.body = json.encode({
      "products": [
        {"product": "${productId}", "quantity": quantity}
      ]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<List> getOptions(
      String refreshToken, String accessToken) async {
    final http.Response response = await http.get(
      Uri.parse('${url}waiter/mybranch'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-refresh': refreshToken,
        'Authorization': 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      var myOptionsList = json.decode(response.body)['options'];
      print(myOptionsList);
      return myOptionsList;
    } else {
      throw Exception("İstek durumu başarısız oldu: ${response.reasonPhrase}");
    }
  }
}
