import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class LoginService {

@override
  Future<Either<void ,Map<String, dynamic>>> logInAttempt(
      {required String email, required String password}) async {
      final response = await Dio().post<Map<String, dynamic>>(
        '127.0.0.1/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode != 200) return const Left(null);
      return Right(response.data!);
  }
}
