part of 'auth.dart';

class AlfredControllerRegister extends AlfredFeatureController {
  @override
  Future<dynamic> post(HttpRequest req, HttpResponse res) async {
    final body = await req.bodyAsJsonMap;
    final name = requiredBodyProperty<String>(body, 'name');
    final email = requiredBodyProperty<String>(body, 'email');
    final password = requiredBodyProperty<String>(body, 'password');

    final userBox = Hive.box<HiveModelUser?>('users');

    final user = userBox.values.firstWhere((element) => element?.email == email, orElse: () {});
    if (user != null) throw AlfredExceptionUserAlreadyExists(email);

    final salt = DBCrypt().gensalt();
    final hashedPassword = DBCrypt().hashpw(password, salt);

    final newUser = HiveModelUser(
      name: name,
      email: email,
      password: hashedPassword,
    );

    await userBox.add(newUser);

    if (!newUser.isInBox) throw AlfredExceptionUserNotCreated(email);

    final accessToken = AccessToken.fromUser(newUser).accessToken;
    final refreshToken = HiveModelRefreshToken.fromUser(newUser);
    await Hive.box<HiveModelRefreshToken?>('refreshtokens').add(refreshToken);

    res.statusCode = HttpStatus.ok;
    await res.json({
      'user': newUser.toMap(),
      'tokens': {
        'access': accessToken,
        'refresh': refreshToken.refreshToken,
      },
    });
  }

  @override
  String get route => '/register';
}

final alfredControllerRegister = AlfredControllerRegister();
