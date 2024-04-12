import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:task_manager_app/home/data/models/TaskModel.dart';
import 'package:task_manager_app/home/data/models/TaskParam.dart';
import 'package:task_manager_app/utilities/constants.dart';

import '../models/GetTodosModel.dart';


part 'todos_api_service.g.dart';

@RestApi(baseUrl: BaseUrl)
abstract class TodosAPiService {
  factory TodosAPiService(Dio dio, {String baseUrl}) = _TodosAPiService;

  @GET("/todos")
  @Headers({"Content-Type": "application/json"})
  Future<GetTodosModel> getTodos(@Query("limit") String limit , @Query("skip") String skip);

  @DELETE('/todos/{id}')
  @Headers({"Content-Type": "application/json"})
  Future<dynamic> deleteTodo(@Path("id") String id);

  @PUT("/todos/{id}")
  @Headers({"Content-Type": "application/json"})
  Future<TaskModel> updateTodo(@Path("id") String id, @Body() TaskParam task);

  @POST("/todos/add")
  @Headers({"Content-Type": "application/json"})
  Future<TaskModel> addTodo(@Body() TaskParam taskParam);
}
