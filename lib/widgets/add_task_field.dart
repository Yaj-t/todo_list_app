import 'package:flutter/material.dart';

class AddTaskField extends StatelessWidget {
  final TextEditingController taskController;
  final FocusNode focusNode; // Added FocusNode parameter
  final Function() onAddTask;

  const AddTaskField({
    required this.taskController,
    required this.onAddTask,
    required this.focusNode, // Added FocusNode parameter
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
              focusNode: focusNode, // Set the FocusNode
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
