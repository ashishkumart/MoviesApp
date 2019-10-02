import 'package:flutter/cupertino.dart';

class UserRepository {
  Future<String> authenticate(
      {@required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
   /* SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');*/
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    // Write token to keystore/key chain
   /* SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);*/
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    // Read token from keystore/key chain
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    return token != null && token != "";*/
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  /*Future<void> getAuthorizationToken() async {
    ApiClient apiClient = ApiClient();
    String token = await apiClient.getToken();
    persistToken(token);
  }*/
}
