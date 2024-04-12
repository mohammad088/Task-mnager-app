part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class AuthenticationError extends LoginState{
  final String message;

  const AuthenticationError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class LoginCompletes extends LoginState{
  @override
  List<Object?> get props => [];
}
