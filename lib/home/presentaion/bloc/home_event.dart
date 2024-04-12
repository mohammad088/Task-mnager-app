part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadTodos extends HomeEvent {
  final String limit = "10";
  final String skip = "0";

  @override
  // TODO: implement props
  List<Object?> get props => [limit];
}

class LoadMore extends HomeEvent {
  final String limit;
  final String skip;

  const LoadMore({required this.limit, required this.skip});

  @override
  // TODO: implement props
  List<Object?> get props => [limit];
}

class UpdateTodo extends HomeEvent {
  final bool completed;
  final String toDo;
  final int userId;
  final String id;

  const UpdateTodo(
      {required this.id ,required this.completed, required this.toDo, required this.userId});

  @override
  // TODO: implement props
  List<Object?> get props => [id,userId];
}

class DeleteTodo extends HomeEvent {
  final num id;

  const DeleteTodo({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class AddTodo extends HomeEvent {
  final bool completed;
  final String toDo;
  final int userId;

  const AddTodo(
      {required this.completed, required this.toDo, required this.userId});

  @override
  List<Object?> get props => [completed, toDo, userId];
}
