import 'package:injectable/injectable.dart';
import 'package:task_manager_app/home/domain/usecases/add_todo_usecase.dart';
import 'package:task_manager_app/home/domain/usecases/get_todos_use_case.dart';
import 'package:task_manager_app/home/domain/usecases/update_todo_usecase.dart';
import 'delete_todo_usecase.dart';

@lazySingleton
class HomeUseCase {
  final AddTodoUseCase addTodo;
  final DeleteTodoUseCase deleteTodo;
  final GetTodosUseCase getTodos;
  final UpdateTodoUseCase updateTodo;

  HomeUseCase(
      {required this.addTodo,
      required this.deleteTodo,
      required this.getTodos,
      required this.updateTodo});
}
