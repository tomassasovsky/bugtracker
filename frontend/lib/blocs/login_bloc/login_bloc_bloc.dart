import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/services/login_service.dart';
import 'package:meta/meta.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc( {required LoginService loginService} ) : _loginService = loginService, super(LoginInitialState()) {
    on<SignInEvent>(_signInPressed);
  }

  final LoginService _loginService; 
  Future<void> _signInPressed( SignInEvent event, Emitter<LoginState> emit) async {

    emit(LoginLoadingState());
    final login = await _loginService.logInAttempt(
      email: event.email, 
      password: event.password
    );

    login.fold((l) => emit(LoginFailedState()), (r) => emit(LoginLoadedState()));

  }
}
