part of 'login_bloc_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class SignInEvent extends LoginEvent {

  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}
