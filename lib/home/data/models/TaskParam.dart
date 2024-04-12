import 'package:task_manager_app/home/domain/entities/Task.dart';

class TaskParam {
  final String todo;
  final bool completed;
  final num userId;

  TaskParam(
      {required this.todo, required this.completed, required this.userId});

  TaskParam.fromJson(dynamic json)
      : todo = json['todo'],
        completed = json['completed'],
        userId = json['userId'];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['todo'] = todo;
    map['completed'] = completed;
    map['userId'] = userId;
    return map;
  }
  Task toTask(num id){
    return Task(id: id, todo: todo, completed: completed, userId: userId);
  }
}
