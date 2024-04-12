import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../home/data/data_source/todos_api_service.dart';

@module
abstract class TodosApiServiceModule {

  @singleton
  TodosAPiService todosAPiService(Dio dio) => TodosAPiService(dio);
}
