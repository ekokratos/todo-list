import 'package:flutter/material.dart';
import 'package:todoey/style.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function taskCallback;

  TaskTile(
      {this.isChecked = false,
      this.taskTitle,
      this.checkboxCallback,
      this.taskCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: taskCallback,
      child: ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            value: isChecked,
            activeColor: kPrimaryColor,
            onChanged: checkboxCallback),
      ),
    );
  }
}
