import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/failure/failure.dart';
import 'package:task_manager_app/core/usecase/usecase_with_params.dart';
import 'package:task_manager_app/home/data/models/TaskParam.dart';
import 'package:task_manager_app/home/domain/entities/Task.dart';
import 'package:task_manager_app/home/domain/repository/home_repository.dart';

@lazySingleton
class AddTodoUseCase extends UseCaseWithParam<Future<Either<Failure,Task>> , TaskParam> {
  final HomeRepository _homeRepository;
  const AddTodoUseCase(this._homeRepository);
  @override
  Future<Either<Failure, Task>> call(TaskParam params) {
    return _homeRepository.addTodo(params);
  }

}