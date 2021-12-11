import 'dart:io';
import 'package:alfred/alfred.dart';
import 'package:dotenv/dotenv.dart';
import 'package:hive/hive.dart';
import 'package:bugtracker/bugtracker.dart';

void main(List<String> arguments) async {
  // load environment variables:
  load();

  // initialize hive:
  String appPath = Directory.current.path;
  Hive.init(appPath);

  // register adapters:
  Hive.registerAdapter(HiveModelUserAdapter());
  Hive.registerAdapter(HiveModelIssueAdapter());
  Hive.registerAdapter(HiveModelCommentAdapter());
  Hive.registerAdapter(HiveModelProjectAdapter());
  Hive.registerAdapter(HiveModelRefreshTokenAdapter());
  Hive.registerAdapter(IssueStatusAdapter());
  Hive.registerAdapter(ProjectStatusAdapter());

  // open hive boxes:
  await Hive.openBox<HiveModelUser?>('users');
  await Hive.openBox<HiveModelRefreshToken?>('refreshtokens');

  // initialize alfred:
  final server = Alfred(onNotFound: (req, res) => throw AlfredExceptionNotFound(req.uri.path));

  // register routes:
  server.all(alfredControllerRegister.route, alfredControllerRegister.handle, middleware: alfredControllerRegister.middleware);
  server.all(alfredControllerLogin.route, alfredControllerLogin.handle, middleware: alfredControllerLogin.middleware);

  // start the server app:
  server.listen(80, '127.0.0.1');
}
