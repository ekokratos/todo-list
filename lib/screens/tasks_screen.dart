import 'package:flutter/material.dart';
import 'package:todoey/style.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: (context),
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.toc,
                    size: 30,
                    color: kPrimaryColor,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text(
                  'To-Do List',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Provider.of<TaskData>(context).taskCount == 0
                      ? Text(
                          'Add tasks',
                          style: TextStyle(color: Colors.black54, fontSize: 24),
                        )
                      : TasksList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
