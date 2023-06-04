import 'package:flutter/material.dart';

import '../model/task_model.dart';

class TaskProvider extends ChangeNotifier {

  List<TaskModel> task = [];

  //read from task model
  // List<TaskModel> get task => tasks;

  //number of counts
  int taskCount() => task.length;

  //add items
  void addTask(String newTaskTitle){
    final addNewTask = TaskModel(name: newTaskTitle);
    task.add(addNewTask);
    notifyListeners();
  }

  //toggle checkbox
  void toggleCheckBox(TaskModel tasks){
    tasks.toggleDone();
    notifyListeners();
  }

  //delete items
  void deleteTask(TaskModel tasks){
    task.remove(tasks);
    notifyListeners();
  }
}