import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import '../widgets/add_task_field.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

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
    List<Task> unfinishedTasks = [];
    for (var task in _tasks) {
      if (task.isCompleted) {
        finishedTasks.add(task);
      } else {
        unfinishedTasks.add(task);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: <Widget>[
                  // Display unfinished tasks first
                  if (unfinishedTasks.isNotEmpty)
                    ExpansionTile(
                      title: Text('${unfinishedTasks.length} Tasks left', style: TextStyle(color: Colors.teal[700], fontWeight: FontWeight.w600)),
                      initiallyExpanded: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton.icon(
                            onPressed: _toggleAllUnfinished,
                            icon: const Icon(Icons.task_alt_outlined),
                            label: const Text('Toggle All Unfinished Tasks'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.tealAccent[700],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
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
                  const SizedBox(height: 16.0),
                  // Display finished tasks
                  if (finishedTasks.isNotEmpty)
                    ExpansionTile(
                      title: Text('${finishedTasks.length} Completed tasks', style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.w600)),
                      initiallyExpanded: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton.icon(
                            onPressed: _toggleAllFinished,
                            icon: const Icon(Icons.check_circle_outline),
                            label: const Text('Toggle All Finished Tasks'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[300],
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: Colors.grey[50],
    );
  }
}
