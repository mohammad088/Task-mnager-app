import 'package:dartz/dartz.dart' hide Task;
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/usecase/usecase_with_params.dart';
import 'package:task_manager_app/home/domain/repository/home_repository.dart';
import '../../../core/failure/failure.dart';
import '../entities/Task.dart';

@lazySingleton
class GetTodosUseCase
    implements UseCaseWith2Params<Future<Either<Failure, List<Task>>>, String , String> {
  const GetTodosUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<Either<Failure, List<Task>>> call(String limit , String skip) {
    return _homeRepository.getTodos(limit , skip);
  }
}
