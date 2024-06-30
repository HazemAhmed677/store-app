import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> get({required String uri, String? token}) async {
    http.Response data;
    if (token != null) {
      data = await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
    } else {
      data = await http.get(Uri.parse(uri));
    }
    if (data.statusCode == 200) {
      List<dynamic> response = jsonDecode(data.body);
      return response;
    } else {
      throw Exception(
          'There something wrong ${data.statusCode} and body ${data.body}');
    }
  }

  Future<Map<String, String>> post(
      {required String url, required dynamic body, String? token}) async {
    http.Response data;
    if (token != null) {
      data = await http.post(Uri.parse(url), body: body, headers: {
        'Authorization': 'Bearer $token',
      });
    } else {
      data = await http.post(Uri.parse(url), body: body);
    }
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      return response;
    } else {
      throw Exception(
          'There  somthing wrong with status code ${data.statusCode} and body ${data.body}');
    }
  }

  Future<Map<String, dynamic>> put(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    http.Response data;
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
      data = await http.put(Uri.parse(url), body: body, headers: headers);
    } else {
      data = await http.put(Uri.parse(url), body: body);
    }
    if (data.statusCode == 200) {
      Map<String, dynamic> res = jsonDecode(data.body);
      return res;
    } else {
      throw Exception(
          'There  somthing wrong with status code ${data.statusCode} and body ${data.body}');
    }
  }
}
