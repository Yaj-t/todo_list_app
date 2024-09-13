import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function(String) onToggleComplete;
  final Function(String) onDelete;

  TaskTile({
    required this.task,
    required this.onToggleComplete,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: task.isCompleted
            ? TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          onToggleComplete(task.id);
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          onDelete(task.id);
        },
      ),
    );
  }
}
