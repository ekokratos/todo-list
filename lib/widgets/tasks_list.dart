import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/style.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Column(
              children: [
                TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                  taskCallback: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Task'),
                            content: Text('Are you sure?'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  taskData.deleteTask(task);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes'),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('No'),
                              )
                            ],
                          );
                        });
                  },
                ),
                if (index < taskData.taskCount)
                  Divider(
                    color: kPrimaryColor.withOpacity(0.15),
                    thickness: 1,
                    // indent: _width * 0.2,
                    // endIndent: _width * 0.2,
                  )
              ],
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
