import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';
import 'package:hive/hive.dart';

import 'package:bugtracker/bugtracker.dart';

part 'tokens.g.dart';

@HiveType(typeId: 6)
class HiveModelRefreshToken extends HiveObject {
  @HiveField(0)
  String refreshToken;

  HiveModelRefreshToken(this.refreshToken);

  factory HiveModelRefreshToken.fromUser(HiveModelUser user) {
    final signature = env['JWT_REFRESH_TOKEN_SIGNATURE'];
    if (signature == null) {
      throw AlfredExceptionInternalServerError('JWT_REFRESH_TOKEN_SIGNATURE is not defined');
    }

    final token = JWT(user.key.toString()).sign(
      SecretKey(signature),
      algorithm: JWTAlgorithm.HS512,
      expiresIn: const Duration(days: 120),
    );

    return HiveModelRefreshToken(token);
  }

  bool get isValid {
    final signature = env['JWT_REFRESH_TOKEN_SIGNATURE'];
    if (signature == null || signature.isEmpty) {
      throw AlfredExceptionInternalServerError('JWT_REFRESH_TOKEN_SIGNATURE is not defined');
    }

    try {
      JWT.verify(
        refreshToken,
        SecretKey(signature),
      );
    } on JWTError {
      return false;
    }
    return true;
  }

  HiveModelUser? get user {
    final signature = env['JWT_REFRESH_TOKEN_SIGNATURE'];
    if (signature == null || signature.isEmpty) {
      throw AlfredExceptionInternalServerError('JWT_REFRESH_TOKEN_SIGNATURE is not defined');
    }

    try {
      final token = JWT.verify(refreshToken, SecretKey(signature));
      final userBox = Hive.box<HiveModelUser?>('users');
      if (userBox.containsKey(token.payload)) {
        return userBox.get(token.payload);
      }
      return null;
    } on JWTError {
      return null;
    }
  }
}

class AccessToken {
  String accessToken;

  AccessToken(this.accessToken);

  factory AccessToken.fromUser(HiveModelUser user) {
    final signature = env['JWT_ACCESS_TOKEN_SIGNATURE'];
    if (signature == null) {
      throw AlfredExceptionInternalServerError('JWT_ACCESS_TOKEN_SIGNATURE is not defined');
    }

    final token = JWT(user.toMap()).sign(
      SecretKey(signature),
      algorithm: JWTAlgorithm.HS512,
      expiresIn: const Duration(days: 1),
    );

    return AccessToken(token);
  }

  bool isValid() {
    final signature = env['JWT_ACCESS_TOKEN_SIGNATURE'];
    if (signature == null || signature.isEmpty) {
      throw AlfredExceptionInternalServerError('JWT_ACCESS_TOKEN_SIGNATURE is not defined');
    }

    try {
      JWT.verify(accessToken, SecretKey(signature));
    } on JWTError {
      return false;
    }
    return true;
  }
}
