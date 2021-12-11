part of 'auth.dart';

class AlfredControllerLogin extends AlfredFeatureController {
  @override
  Future<dynamic> post(HttpRequest req, HttpResponse res) async {
    final body = await req.bodyAsJsonMap;
    final email = requiredBodyProperty<String>(body, 'email');
    final password = requiredBodyProperty<String>(body, 'password');

    final userBox = Hive.box<HiveModelUser?>('users');

    final user = userBox.values.firstWhere((element) => element?.email == email, orElse: () {});
    if (user == null) throw AlfredExceptionUserNotFound(email);

    final isCorrect = DBCrypt().checkpw(password, user.password);
    if (!isCorrect) throw AlfredExceptionInvalidCredentials(InvalidCredentialsType.invalidPassword);

    res.statusCode = 200;

    final accessToken = AccessToken.fromUser(user).accessToken;
    final refreshToken = HiveModelRefreshToken.fromUser(user);
    await Hive.box<HiveModelRefreshToken?>('refreshtokens').add(refreshToken);

    res.json({
      'user': user.toMap(),
      'tokens': {
        'access': accessToken,
        'refresh': refreshToken.refreshToken,
      }
    });
  }

  @override
  Future<dynamic> delete(HttpRequest req, HttpResponse res) async {
    final authorization = req.headers.value('Authorization');
    if (authorization == null) throw AlfredExceptionUnauthorized();
    final tokenStr = authorization.split('Bearer ')[1];

    final hiveBox = Hive.box<HiveModelRefreshToken?>('refreshtokens');
    final refreshToken = hiveBox.values.where((element) => element?.refreshToken == tokenStr);
    if (refreshToken.isEmpty) throw AlfredExceptionUnauthorized();

    for (var element in refreshToken) {
      await element?.delete();
      if (element?.isInBox ?? false) {
        throw AlfredExceptionInternalServerError('Failed to delete token');
      }
    }

    res.json({'status': 'ok'});
  }

  @override
  Future<dynamic> get(HttpRequest req, HttpResponse res) async {
    final authorization = req.headers.value('Authorization');
    if (authorization == null) throw AlfredExceptionUnauthorized();
    final tokenStr = authorization.split('Bearer ')[1];

    final hiveBoxRefreshToken = Hive.box<HiveModelRefreshToken?>('refreshtokens');
    final refreshToken = hiveBoxRefreshToken.values.firstWhere((element) => element?.refreshToken == tokenStr, orElse: () {});
    if (refreshToken == null) throw AlfredExceptionUnauthorized();

    if (refreshToken.isInBox && refreshToken.isValid) {
      final user = refreshToken.user;
      if (user == null) throw AlfredExceptionUnauthorized();

      final accessToken = AccessToken.fromUser(user).accessToken;
      res.statusCode = 200;
      res.json({
        'tokens': {
          'access': accessToken,
          'refresh': refreshToken.refreshToken,
        }
      });
      return;
    }
    res.statusCode = 404;
    res.close();
  }

  @override
  String get route => '/login';
}

final alfredControllerLogin = AlfredControllerLogin();
