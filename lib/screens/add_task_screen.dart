import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/style.dart';

class AddTaskScreen extends StatelessWidget {
  static String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              autofocus: false,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kSecondaryColor, width: 1.2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kSecondaryColor, width: 1.0),
                ),
              ),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => kPrimaryColor),
              ),
              onPressed: () {
                if (newTaskTitle.isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  BotToast.showText(text: "Item added");
                  Navigator.pop(context);
                } else
                  BotToast.showText(text: "Enter text");
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
