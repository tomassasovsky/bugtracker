import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/blocs/login_bloc/login_bloc_bloc.dart';
import 'package:frontend/services/login_service.dart';
import 'package:frontend/widgets/textformfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginBloc loginBloc = LoginBloc(loginService: LoginService());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign in to BugTracker',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w300)),
            const SizedBox(height: 30),
            Container(
                width: 350,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(3)),
                child: _form(context)),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'register_screen'),
                child: const Text('New in BugTracker? Create an account',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300)))
          ],
        ),
      ),
    );
  }

  _form(BuildContext context) {
    return Form(
      key: _key,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TextFormFieldWidget(
                title: 'Username or email address',
                controller: emailController,
                keyboardType: TextInputType.emailAddress),
            TextFormFieldWidget(
                title: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword),
            const SizedBox(height: 20),
            button(context, title: 'Sign In'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  button(BuildContext context, {String title = ''}) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {

        if( loginBloc.state == LoginInitialState ) {
          return MaterialButton(
            child: Text(title),
            height: 40,
            minWidth: double.maxFinite,
            color: Colors.green,
            onPressed: () {
            if (_key.currentState!.validate()) {
              context.read<LoginBloc>().add(
                  SignInEvent(emailController.text, passwordController.text));
            }
            }
          );
        } else if( loginBloc.state == LoginLoadingState ){
           return const CircularProgressIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
