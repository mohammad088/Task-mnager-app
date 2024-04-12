import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/usecase/usecase_with_params.dart';
import 'package:task_manager_app/home/domain/repository/home_repository.dart';

import '../../../core/failure/failure.dart';

@lazySingleton
class DeleteTodoUseCase
    extends UseCaseWithParam<Future<Either<Failure, dynamic>>, String> {
  const DeleteTodoUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<Either<Failure, dynamic>> call(String id) async {
    return await _homeRepository.deleteTodo(id);
  }
}
