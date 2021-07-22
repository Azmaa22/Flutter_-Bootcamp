import 'package:flutter/material.dart';
import 'task_Tail.dart';
import 'package:to_do_list/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.getCurrentTasksCount(),
        itemBuilder: (BuildContext context, int index) {
          final task = taskData.tasksList()[index];
          return TaskTail(
            isChecked: task.isDone,
            taskTitle: task.name,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallback: () {
              taskData.deleteTask(task);
            },
          );
        },
      );
    });
  }
}
