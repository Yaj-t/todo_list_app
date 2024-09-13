import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(String) onToggleComplete;
  final Function(String) onDelete;

  const TaskList({
    required this.tasks,
    required this.onToggleComplete,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(
          task: task,
          onToggleComplete: onToggleComplete,
          onDelete: onDelete,
        );
      },
    );
  }
}
