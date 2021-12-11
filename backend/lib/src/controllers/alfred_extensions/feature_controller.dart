import 'dart:async';
import 'dart:io';
import 'package:alfred/alfred.dart';

import 'package:bugtracker/src/controllers/alfred_extensions/custom_alfred_exceptions.dart';

abstract class AlfredFeatureController {
  Future<dynamic> get(HttpRequest req, HttpResponse res) async {
    throw AlfredExceptionNotImplemented(req.uri.path);
  }

  Future<dynamic> post(HttpRequest req, HttpResponse res) async {
    throw AlfredExceptionNotImplemented(req.uri.path);
  }

  Future<dynamic> put(HttpRequest req, HttpResponse res) async {
    throw AlfredExceptionNotImplemented(req.uri.path);
  }

  Future<dynamic> delete(HttpRequest req, HttpResponse res) async {
    throw AlfredExceptionNotImplemented(req.uri.path);
  }

  Future<dynamic> handle(HttpRequest req, HttpResponse res) async {
    final methodToFunction = {
      'GET': get,
      'POST': post,
      'PUT': put,
      'DELETE': delete,
    };
    return methodToFunction[req.method]!(req, res);
  }

  List<FutureOr Function(HttpRequest req, HttpResponse res)> get middleware => [];

  T requiredBodyProperty<T>(dynamic object, String name) => _requiredBody(object[name], name);

  T _requiredBody<T>(dynamic input, String name) {
    if (input == null) {
      throw AlfredExceptionInvalidParameters(name, 'Expected ${T.toString()}', input);
    }
    if (input is String && input.trim().isEmpty) {
      throw AlfredExceptionInvalidParameters(name, 'Expected ${T.toString()}', input);
    }

    if (T == num || T == int || T == double) {
      if ((input is String ? num.parse(input) : input) <= 0) {
        throw AlfredExceptionInvalidParameters(name, 'Expected ${T.toString()}', input);
      }
      if (T == int && input is String) {
        return num.parse(input).toInt() as T;
      }
      if (T == double && input is String) {
        return num.parse(input).toDouble() as T;
      }

      if (T == num && input is String) {
        return num.parse(input) as T;
      }
    }
    if (input is! T) {
      throw AlfredExceptionInvalidParameters(name, 'Expected ${T.toString()}', input);
    } else {
      return input;
    }
  }

  String get route;
}
