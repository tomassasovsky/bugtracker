part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginState  extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class LoginInitialState extends LoginState {
  LoginInitialState() : super();
}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {}

class LoginFailedState extends LoginState {}


