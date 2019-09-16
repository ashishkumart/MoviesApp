import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/networking/response/token_response.dart';

class ApiClient {
  http.Client httpClient = http.Client();
  static final ApiClient _instance = ApiClient._internal();
  static const apiKey = '4ce613c29769e6f1c1b5439229d5a3eb';
  static const baseUrl = 'https://api.themoviedb.org';

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    //Initialization
  }

  Future<String> getToken() async {
    String url = "$baseUrl/3/authentication/token/new?api_key=$apiKey";
    final tokenRes = await httpClient.get(url);
    if (tokenRes.statusCode != 200) {
      throw Exception('Error getting authorization token');
    }

    final json = jsonDecode(tokenRes.body);
    return TokenResponse.json(json).requestToken;
  }
}
