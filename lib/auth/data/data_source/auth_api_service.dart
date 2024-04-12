import 'package:dio/dio.dart' hide Headers ;
import 'package:retrofit/http.dart';
import 'package:task_manager_app/utilities/constants.dart';
import '../models/user_model.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: BaseUrl)
abstract class AuthApiService{
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;
  @POST("/auth/login")
  @Headers({
    "Content-Type" : "application/json"
  })
  Future<UserModel> login(@Body() String username ,@Body() String password);
}