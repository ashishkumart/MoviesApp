import 'package:flutter/cupertino.dart';

class UserRepository {
  Future<String> authenticate(
      {@required String username, @required String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    // Write token to keystore/key chain
  }

  Future<bool> hasToken() async {
    // Read token from keystore/key chain
    return false;
  }
}
