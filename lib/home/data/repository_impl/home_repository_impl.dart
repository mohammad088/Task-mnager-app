import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/errors/Exceptions.dart';
import 'package:task_manager_app/home/data/data_source/todos_data_source.dart';
import 'package:task_manager_app/home/data/models/TaskParam.dart';
import 'package:task_manager_app/home/domain/entities/Task.dart';
import 'package:task_manager_app/home/domain/repository/home_repository.dart';

import '../../../core/failure/failure.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._todosDataSource);

  final TodosDataSource _todosDataSource;

  @override
  Future<Either<Failure, List<Task>>> getTodos(
      String limit, String skip) async {
    try {
      final result = await _todosDataSource.getTodos(limit, skip);
      return Right(result.map((e) => e.toTask()).toList());
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteTodo(String id) async {
    try {
      await _todosDataSource.deleteTodo(id);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Task>> updateTodo(String id, TaskParam task) async {
    try {
      final result = await _todosDataSource.updateTodos(id, task);
      return Right(result.toTask());
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Task>> addTodo(TaskParam taskParam) async {
    try {
      final result = await _todosDataSource.addTodo(taskParam);
      return Right(result.toTask());
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    }
  }
}
