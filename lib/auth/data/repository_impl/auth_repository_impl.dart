import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/auth/data/data_source/auth_remote_data_source.dart';
import 'package:task_manager_app/auth/domain/repository/auth_repository.dart';
import 'package:task_manager_app/core/errors/Exceptions.dart';
import 'package:task_manager_app/core/failure/failure.dart';
import '../../../utilities/type_defs.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  const AuthRepositoryImpl(this._authRemoteDataSource);
  final AuthRemoteDataSource _authRemoteDataSource;
  @override
  AuthResult login(String username, String password) async {
    try{
      final result = await _authRemoteDataSource.login(username, password);
      return Right(result.toUser());
    }on ApiException catch(e){
      return Left(ApiFailure(e.message));
    }
  }
}