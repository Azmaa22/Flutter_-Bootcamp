import 'package:flutter/foundation.dart';
import 'package:to_do_list/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  List<Task> _tasksList = [
    Task(name: 'Task01'),
    Task(name: 'Task02'),
    Task(name: 'Task03'),
    Task(name: 'Task04'),
    // Task(name: 'Task05'),
  ];
UnmodifiableListView<Task>  tasksList(){
  return UnmodifiableListView(this._tasksList);
}
  int getCurrentTasksCount(){
    return this._tasksList.length;
  }
  void addNewTask(String taskTitle){
    this._tasksList.add(Task(name: taskTitle));
    notifyListeners();

  }
  void updateTask(Task task){
  task.toggleDone();
  notifyListeners();
  }
  void deleteTask(Task task){
  this._tasksList.remove(task);
  notifyListeners();
  }
}