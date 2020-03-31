import 'dart:convert';

import 'package:starwars/core/models/jwt_payload.dart';

class JWT {
  
  Map<String, dynamic> _parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  JWTPayload decodeJwt(String token) {
    Map<String, dynamic> tokenDecoded = _parseJwt(token);
    Map<String, dynamic> consumer = tokenDecoded['consumer'];
    String consumerId = consumer['id'].toString();
    return JWTPayload(consumerId);
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
