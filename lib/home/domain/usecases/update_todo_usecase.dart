import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/usecase/usecase_with_params.dart';
import 'package:task_manager_app/home/data/models/TaskParam.dart';
import 'package:task_manager_app/home/domain/repository/home_repository.dart';

import '../../../core/failure/failure.dart';
import '../entities/Task.dart';

@lazySingleton
class UpdateTodoUseCase
    implements
        UseCaseWith2Params<Future<Either<Failure, Task>>, String, TaskParam> {
  final HomeRepository _homeRepository;

  const UpdateTodoUseCase(this._homeRepository);

  @override
  Future<Either<Failure, Task>> call(String id, TaskParam taskParam) async {
    return await _homeRepository.updateTodo(id, taskParam);
  }
}
