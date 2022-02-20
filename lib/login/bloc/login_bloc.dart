import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial(password: '', username: 'Guest')) {
    on<Logging>((event, emit) {
      emit(LoginInitial(password: event.password, username: event.username));
    });
  }
}
