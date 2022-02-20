part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  String username;
  String password;
  LoginState({required this.password, required this.username});

  @override
  List<Object> get props => [password, username];
}

class LoginInitial extends LoginState {
  final String username;
  final String password;

  LoginInitial({required this.password, required this.username})
      : super(password: password, username: username);
}
