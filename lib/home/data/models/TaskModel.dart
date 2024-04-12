import '../../domain/entities/Task.dart';

class TaskModel {
  TaskModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  TaskModel.fromJson(dynamic json)
      : id = json['id'],
        todo = json['todo'],
        completed = json['completed'],
        userId = json['userId'];

  final num id;
  final String todo;
  final bool completed;
  final num userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['todo'] = todo;
    map['completed'] = completed;
    map['userId'] = userId;
    return map;
  }

  Task toTask() {
    return Task(id: id, completed: completed, todo: todo, userId: userId);
  }
}
