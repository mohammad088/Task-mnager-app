import 'package:task_manager_app/home/data/models/TaskModel.dart';

class GetTodosModel {
  GetTodosModel({
      required this.todos,
      required this.total,
      required this.skip,
      required this.limit,});


  GetTodosModel.fromJson(dynamic json) :
      todos = json['todos'].map((v) =>
        TaskModel.fromJson(v)
      ).cast<TaskModel>().toList(),
    total = json['total'],
    skip = json['skip'],
    limit = json['limit'];


  List<TaskModel> todos;
  num total;
  num skip;
  num limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['todos'] = todos.map((v) => v.toJson()).toList();
      map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}