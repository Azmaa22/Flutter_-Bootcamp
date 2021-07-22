import 'package:flutter/material.dart';
import 'package:to_do_list/constants.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     String newTaskTitle = '';
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: kContainerStyle,
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Text(
              'Add Task',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                print(newText);
                newTaskTitle = newText;
                print('newTaskTitle: $newTaskTitle');
              },
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                onPressed: () {
                  print("-->$newTaskTitle");
                  print('Closed');
                  Provider.of<TaskData>(context,listen: false).addNewTask(newTaskTitle);
                  Navigator.pop(context);
                },
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
