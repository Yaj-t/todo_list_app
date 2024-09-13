import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/add_task_field.dart';
import '../widgets/task_tile.dart'; // Import TaskTile

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final List<Task> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isEmpty) return;
    setState(() {
      _tasks.add(Task(id: DateTime.now().toString(), title: _taskController.text));
    });
    _taskController.clear();
  }

  void _deleteTask(String taskId) {
    setState(() {
      _tasks.removeWhere((task) => task.id == taskId);
    });
  }

  void _toggleComplete(String taskId) {
    setState(() {
      final task = _tasks.firstWhere((task) => task.id == taskId);
      task.isCompleted = !task.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AddTaskField(
              taskController: _taskController,
              onAddTask: _addTask,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return TaskTile(
                  task: task,
                  onToggleComplete: _toggleComplete,
                  onDelete: _deleteTask,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
