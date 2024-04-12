import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/home/data/models/TaskParam.dart';

import '../../domain/entities/Task.dart';
import '../../domain/usecases/home_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase _homeUseCase;
  final List<Task> todosBloc = [];
  String skip = "0";
  String limit = "10";

  HomeBloc(this._homeUseCase) : super(HomeInitial()) {
    on<LoadTodos>((event, emit) async {
      emit(LoadingTodos());
      final result = await _homeUseCase.getTodos(event.limit, event.skip);
      result.fold((failure) => emit(AuthenticationError(failure.message)),
              (todos) {
            todosBloc.addAll(todos);
            emit(TodosLoaded(todosBloc));
          });
    });
    on<LoadMore>((event, emit) async {
      emit(LoadingTodos());
      final result = await _homeUseCase.getTodos(event.limit, event.skip);
      result.fold((failure) => emit(AuthenticationError(failure.message)),
              (todos) {
            todosBloc.addAll(todos);
            emit(TodosLoaded(todosBloc));
          });
    });
    on<UpdateTodo>((event, emit) async {
      final result = await _homeUseCase.updateTodo(
          event.id,
          TaskParam(
              todo: event.toDo,
              completed: event.completed,
              userId: event.userId));
      result.fold(
              (failure) => emit(AuthenticationError(failure.message)), (
          r) => null);
    });
    on<DeleteTodo>((event, emit) async {
      final result = await _homeUseCase.deleteTodo(event.id.toString());
      result.fold(
              (failure) => emit(AuthenticationError(failure.message)), (r) =>
          add(LoadTodos()));
    });
    on<AddTodo>((event, emit) async {
      final result = await _homeUseCase.addTodo(TaskParam(
          todo: event.toDo, completed: event.completed, userId: event.userId));
      result.fold(
              (failure) => emit(AuthenticationError(failure.message)), (
          r) => null);
    });
  }
}
