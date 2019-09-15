import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/networking/response/token_response.dart';

class ApiClient {
  static const apiKey = '4ce613c29769e6f1c1b5439229d5a3eb';
  static const baseUrl = 'https://api.themoviedb.org';
  final http.Client httpClient;

  ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<String> getToken() async {
    String url = "/3/authentication/token/new?api_key=$apiKey";
    final tokenRes = await this.httpClient.get(url);
    if (tokenRes.statusCode != 200) {
      throw Exception('Error getting authorization token');
    }

    final json = jsonDecode(tokenRes.body);
    return TokenResponse.json(json).requestToken;
  }
}
