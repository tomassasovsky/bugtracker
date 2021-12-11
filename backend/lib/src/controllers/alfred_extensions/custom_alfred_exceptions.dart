import 'dart:io';

import 'package:alfred/alfred.dart';

class AlfredExceptionInvalidParameters implements AlfredException {
  final String param;
  final String expected;
  final dynamic input;

  AlfredExceptionInvalidParameters(this.param, this.expected, this.input);

  @override
  String toString() => 'InvalidParametersException: $param';

  @override
  Object? get response {
    return {
      'msg': 'Invalid parameters',
      'param': param,
      'details': {
        'expected': expected,
        'input': input,
      }
    };
  }

  @override
  int get statusCode => HttpStatus.badRequest;
}

class AlfredExceptionUserNotFound implements AlfredException {
  final String email;

  AlfredExceptionUserNotFound(this.email);

  @override
  String toString() => 'UserNotFoundException: $email';

  @override
  Object? get response {
    return {
      'msg': 'User not found',
      'param': 'email',
      'detail': {
        'input': email,
      },
    };
  }

  @override
  int get statusCode => HttpStatus.notFound;
}

class AlfredExceptionUserAlreadyExists implements AlfredException {
  final String email;

  AlfredExceptionUserAlreadyExists(this.email);

  @override
  String toString() => 'AlfredUserAlreadyExistsException: $email';

  @override
  Object? get response {
    return {
      'msg': 'User already exists',
      'param': 'email',
      'detail': {
        'input': email,
      },
    };
  }

  @override
  int get statusCode => HttpStatus.conflict;
}

class AlfredExceptionInvalidCredentials implements AlfredException {
  AlfredExceptionInvalidCredentials(this.type);
  final InvalidCredentialsType type;

  @override
  String toString() => 'InvalidCredentialsException';

  @override
  Object? get response {
    return {
      'msg': 'Invalid credentials',
      'param': type.toString().split('invalid').last.toLowerCase(),
    };
  }

  @override
  int get statusCode => HttpStatus.unauthorized;
}

enum InvalidCredentialsType {
  invalidPassword,
  invalidToken,
}

class AlfredExceptionUserNotCreated implements AlfredException {
  final String email;

  AlfredExceptionUserNotCreated(this.email);

  @override
  String toString() => 'UserNotCreatedException: $email';

  @override
  Object? get response {
    return {
      'msg': 'User not created',
      'param': 'email',
      'detail': {
        'input': email,
      },
    };
  }

  @override
  int get statusCode => HttpStatus.internalServerError;
}

class AlfredExceptionNotImplemented implements AlfredException {
  AlfredExceptionNotImplemented(this.path);
  final String path;

  @override
  String toString() => 'NotImplementedException';

  @override
  Object? get response {
    return {
      'msg': 'Endpoint not implemented',
      'param': 'path',
      'detail': {
        'input': path,
      },
    };
  }

  @override
  int get statusCode => HttpStatus.notImplemented;
}

class AlfredExceptionNotFound implements AlfredException {
  AlfredExceptionNotFound(this.path);
  final String path;

  @override
  String toString() => 'NotFoundException';

  @override
  Object? get response {
    return {
      'msg': 'Endpoint not found',
      'param': 'path',
      'detail': {
        'input': path,
      },
    };
  }

  @override
  int get statusCode => HttpStatus.notFound;
}

class AlfredExceptionInternalServerError implements AlfredException {
  AlfredExceptionInternalServerError(this.msg, {this.param, this.input});
  final String msg;
  final String? param;
  final dynamic input;

  @override
  String toString() => 'NotImplementedException';

  @override
  Object? get response {
    return {
      'msg': msg,
      if (param != null && (param?.isNotEmpty ?? false)) 'param': param,
      if (input != null && input.toString().isNotEmpty)
        'detail': {
          'input': input.toString(),
        },
    };
  }

  @override
  int get statusCode => HttpStatus.internalServerError;
}

class AlfredExceptionUnauthorized implements AlfredException {
  @override
  String toString() => 'UnauthorizedException';

  @override
  Object? get response => {'msg': 'Unauthorized'};

  @override
  int get statusCode => HttpStatus.unauthorized;
}
