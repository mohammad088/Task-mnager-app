part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class AuthenticationError extends HomeState{
  final String message;
  const AuthenticationError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => throw [message];
}

class LoadingTodos extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class TodosLoaded extends HomeState {
  final String limit = '10';
  final List<Task> tasks;
  const TodosLoaded(this.tasks);
  @override
  // TODO: implement props
  List<Object?> get props => [tasks];
}

