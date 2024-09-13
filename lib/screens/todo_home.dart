import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import '../widgets/add_task_field.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final List<Task> _tasks = [];
  final TextEditingController _taskController = TextEditingController();
  final FocusNode _taskFocusNode = FocusNode();

  void _addTask() {
    if (_taskController.text.isEmpty) return;
    setState(() {
      _tasks.add(Task(id: DateTime.now().toString(), title: _taskController.text));
    });
    _taskController.clear();
    FocusScope.of(context).requestFocus(_taskFocusNode);
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

  void _toggleAllUnfinished() {
    setState(() {
      for (var task in _tasks.where((task) => !task.isCompleted)) {
        task.isCompleted = true;
      }
    });
  }

  void _toggleAllFinished() {
    setState(() {
      for (var task in _tasks.where((task) => task.isCompleted)) {
        task.isCompleted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Task> finishedTasks = [];
    List<Task> unfinishedTasks = [];;
    for (var task in _tasks) {
      if (task.isCompleted) {
        finishedTasks.add(task);
      } else {
        unfinishedTasks.add(task);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                // Display unfinished tasks first
                if (unfinishedTasks.isNotEmpty)
                  ExpansionTile(
                    title: Text('${unfinishedTasks.length} Tasks left'),
                    initiallyExpanded: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: _toggleAllUnfinished,
                          child: Text('Toggle All Unfinished Tasks'),
                        ),
                      ),
                      TaskList(
                        tasks: unfinishedTasks,
                        onToggleComplete: _toggleComplete,
                        onDelete: _deleteTask,
                      ),
                    ],
                  ),
                // Add Task Input Field after unfinished tasks
                AddTaskField(
                  taskController: _taskController,
                  onAddTask: _addTask,
                  focusNode: _taskFocusNode,
                ),
                // Display finished tasks
                if (finishedTasks.isNotEmpty)
                  ExpansionTile(
                    title: Text('${finishedTasks.length} Completed tasks'),
                    initiallyExpanded: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: _toggleAllFinished,
                          child: Text('Toggle All Finished Tasks'),
                        ),
                      ),
                      TaskList(
                        tasks: finishedTasks,
                        onToggleComplete: _toggleComplete,
                        onDelete: _deleteTask,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
