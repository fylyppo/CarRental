part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  String username;
  String password;
  LoginEvent(
    {required this.username,
    required this.password,
    });

  @override
  List<Object> get props => [username, password];
}

class Logging extends LoginEvent {
  final String username;
  final String password;
  Logging({
    required this.username,
    required this.password,
  }) : super(username: username, password: password);
}
