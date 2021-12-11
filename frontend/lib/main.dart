import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:frontend/blocs/register_bloc/register_bloc.dart';
import 'package:frontend/services/login_service.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LoginBloc(loginService: LoginService())),
        BlocProvider(create: (BuildContext context) => RegisterBloc())

      ],
      child: MaterialApp(
        title: 'Bug Tracker',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login_screen',
        routes: routes,
      ),
    );
  }
}
