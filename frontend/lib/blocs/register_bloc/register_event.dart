part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable{
   @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OnRegisterEvent extends RegisterEvent {

  final String name;
  final String email;
  final String password;

  OnRegisterEvent(this.name,this.email, this.password);
}
