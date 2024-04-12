import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/login_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase)
      : super(LoginInitial()) {
    on<OnLoginButtonPressed>((event, emit) async {
      final result = await _loginUseCase(event.username, event.password);
      result.fold(
          (failure) => emit(AuthenticationError(message: failure.message)),
          (user) => emit(LoginCompletes()));
    });
  }
}
