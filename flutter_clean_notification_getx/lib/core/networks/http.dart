import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomHttp {
  _header(String token) {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return headers;
  }

  _response(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  http.Response response;

  dynamic getRequest({String path, String token}) async {
    try {
      response = await http.get('$path', headers: _header(token));
      return _response(response);
    } catch (e) {
      print(e);
    }
  }

  dynamic postRequest({String path, String body, String token}) async {
    try {
      response = await http.post(
        '$path',
        body: body,
        headers: _header(token),
      );
      return _response(response);
    } catch (e) {
      print(e);
    }
  }

  dynamic putRequest({String path, String body, String token}) async {
    try {
      response = await http.put('$path', body: body, headers: _header(token));
      return _response(response);
    } catch (e) {
      print(e);
    }
  }

  dynamic deleteRequest({String path, String token}) async {
    try {
      response = await http.delete('$path', headers: _header(token));
      return _response(response);
    } catch (e) {
      print(e);
    }
  }
}
