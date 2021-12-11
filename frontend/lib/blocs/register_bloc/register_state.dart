part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {
  RegisterInitialState() : super();
}

class RegisterLoadingState extends RegisterState {}

class RegisterLoadedState extends RegisterState {}

class RegisterFailedState extends RegisterState {}
