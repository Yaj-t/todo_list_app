import 'package:flutter/material.dart';

class AddTaskField extends StatelessWidget {
  final TextEditingController taskController;
  final Function() onAddTask;

  const AddTaskField({
    required this.taskController,
    required this.onAddTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: taskController,
              onSubmitted: (_) => onAddTask(),
              decoration: InputDecoration(
                labelText: 'List item',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: onAddTask,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
