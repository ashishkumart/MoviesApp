import 'dart:math';

import 'package:equatable/equatable.dart';

class TokenResponse extends Equatable {
  final bool success;
  final String expiresAt;
  final String requestToken;

  TokenResponse({this.success, this.expiresAt, this.requestToken})
      : super([success, expiresAt, requestToken]);

  factory TokenResponse.json(Map<String, dynamic> json) {
    return TokenResponse(
        success: json["success"],
        expiresAt: json["expires_at"],
        requestToken: json["request_token"]);
  }
}
