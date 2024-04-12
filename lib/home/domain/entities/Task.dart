class Task {
  final num id;
  final String todo;
  final bool completed;
  final num userId;

  Task({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  Task.empty()
      : id = 1,
        completed = true,
        todo = "todo",
        userId = 1;
}
