import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/auth/data/data_source/auth_api_service.dart';
import 'package:task_manager_app/core/errors/Exceptions.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
}
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._authApiService);

  final AuthApiService _authApiService;

  @override
  Future<UserModel> login(String username, String password) async {
    try {
      final result = await _authApiService.login(username, password);
      SharedPreferences preferences =await SharedPreferences.getInstance();
      preferences.setString("token", result.token);
      return result;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? "Un Expected error occurred",
          statusCode: e.response!.statusCode!);
    } on Exception {
      throw ApiException(
          message: "Un Expected error occurred", statusCode: 500);
    }
  }
}
