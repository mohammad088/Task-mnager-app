import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_manager_app/home/presentaion/widgets/switch.dart';

import '../../domain/entities/Task.dart';
import '../bloc/home_bloc.dart';

Widget todoItem(BuildContext ctx, Task task) {
  bool isCompleted = task.completed;
  TextEditingController toDoController = TextEditingController(
    text: task.todo
  );
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(8),
          padding: const EdgeInsets.all(8),
          flex: 2,
          onPressed: (_) {
            ctx.read<HomeBloc>().add(DeleteTodo(id: task.id));
          },
          backgroundColor: const Color(0xFFFF3043),
          foregroundColor: Colors.white,
          icon: Icons.archive,
          label: 'Delete',
        ),
        SlidableAction(
          padding: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
          flex: 3,
          onPressed: (_) {
            showDialog(
              context: _,
              builder: (_) {
                return Dialog(
                  child: Container(
                    width: MediaQuery.of(ctx).size.width * 0.80,
                    height: MediaQuery.of(ctx).size.height * 0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Edit",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          TextField(
                            controller: toDoController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                                hintText: "name"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("IS COMPLETED" ,style: TextStyle(fontSize: 20),),
                              SizedBox(
                                width: 100,
                                height: 50,
                                child: FittedBox(
                                  child: SwitchComplete(
                                    isCompleted
                                  )
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                ctx.read<HomeBloc>().add(UpdateTodo(
                                    id: task.id.toString(),
                                    completed: isCompleted,
                                    toDo: toDoController.text,
                                    userId: task.userId.toInt()));
                                Navigator.pop(ctx);
                              },
                              child: const Text("Submit"))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: const Color(0xFF7BC043),
          foregroundColor: Colors.white,
          icon: Icons.add_box_outlined,
          label: 'Edit',
        )
      ],
    ),
    child: Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      height: 100,
      width: MediaQuery.of(ctx).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              task.todo,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: task.completed ? Colors.green : Colors.red),
            child: Icon(
              task.completed ? Icons.check : Icons.clear,
              color: Colors.white,
            ),
          )
        ],
      ),
    ),
  );
}
