import 'package:flutter/cupertino.dart';
import 'package:movies_app/networking/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<String> authenticate(
      {@required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<void> persistToken(String token) async {
    // Write token to keystore/key chain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<bool> hasToken() async {
    // Read token from keystore/key chain
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token != null && token != "";
  }

  Future<void> getAuthorizationToken() async {
    ApiClient apiClient = ApiClient();
    String token = await apiClient.getToken();
    persistToken(token);
  }
}
