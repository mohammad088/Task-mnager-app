import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/errors/Exceptions.dart';
import 'package:task_manager_app/home/data/data_source/todos_api_service.dart';
import 'package:task_manager_app/home/data/models/TaskModel.dart';
import 'package:task_manager_app/home/data/models/TaskParam.dart';

abstract class TodosDataSource {
  const TodosDataSource();

  Future<List<TaskModel>> getTodos(String limit, String skip);

  Future<dynamic> deleteTodo(String id);

  Future<TaskModel> updateTodos(String id, TaskParam task);

  Future<TaskModel> addTodo(TaskParam taskParam);
}

@LazySingleton(as: TodosDataSource)
class TodosDataSourceImpl implements TodosDataSource {
  const TodosDataSourceImpl(this._todosAPiService);

  final TodosAPiService _todosAPiService;

  @override
  Future<List<TaskModel>> getTodos(String limit, String skip) async {
    try {
      final result = await _todosAPiService.getTodos(limit, skip);
      return result.todos;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? "Unexpected error occurred",
          statusCode: e.response!.statusCode!);
    } on Exception {
      throw ApiException(message: "Unexpected error occurred", statusCode: 500);
    }
  }

  @override
  Future deleteTodo(String id) async {
    try {
      await _todosAPiService.deleteTodo(id);
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? "Unexpected error occurred",
          statusCode: e.response!.statusCode!);
    } on Exception {
      throw ApiException(message: "Unexpected error occurred", statusCode: 500);
    }
  }

  @override
  Future<TaskModel> updateTodos(String id, TaskParam task) async {
    try {
      final result = await _todosAPiService.updateTodo(id, task);
      return result;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? "Unexpected error occurred",
          statusCode: e.response!.statusCode!);
    } on Exception {
      throw ApiException(message: "Unexpected error occurred", statusCode: 500);
    }
  }

  @override
  Future<TaskModel> addTodo(TaskParam taskParam) async {
    try {
      final result = await _todosAPiService.addTodo(taskParam);
      return result;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? "Unexpected error occurred",
          statusCode: e.response!.statusCode!);
    } on Exception {
      throw ApiException(message: "Unexpected error occurred", statusCode: 500);
    }
  }
}
