import 'package:dartz/dartz.dart' hide Task;
import 'package:task_manager_app/core/failure/failure.dart';

import '../../data/models/TaskParam.dart';
import '../entities/Task.dart';

abstract class HomeRepository {
  Future<Either<Failure , List<Task>>> getTodos(String limit , String skip);
  Future<Either<Failure,dynamic>> deleteTodo(String id);
  Future<Either<Failure,Task>> updateTodo(String id , TaskParam task);
  Future<Either<Failure , Task>> addTodo(TaskParam taskParam);
}