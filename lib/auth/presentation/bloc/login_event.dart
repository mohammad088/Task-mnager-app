part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class OnLoginButtonPressed extends LoginEvent{
  final String username;
  final String password;

  const OnLoginButtonPressed({required this.username, required this.password});
  @override
  List<Object?> get props => [username , password];
}
