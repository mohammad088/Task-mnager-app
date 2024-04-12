import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../auth/data/data_source/auth_api_service.dart';
import '../utilities/constants.dart';

@module
abstract class AuthApiServiceModule {
  @singleton
  Dio get dio => Dio(); // Provides a singleton Dio instance

  @preResolve // Ensures the baseUrl is injected before the AuthApiService is resolved
  Future<AuthApiService> get authApiService async {
    final dio = Dio(); // Create a new Dio instance
    dio.options.baseUrl = BaseUrl; // Set the base URL
    return AuthApiService(dio); // Provide the AuthApiService
  }
}