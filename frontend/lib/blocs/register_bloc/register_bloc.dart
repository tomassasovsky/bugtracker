import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    on<OnRegisterEvent>(_onRegisterEvent);
  }

  _onRegisterEvent( OnRegisterEvent event, Emitter<RegisterState> emit) {


  }
}
