import 'package:flutter/material.dart';
import 'package:todo_app_provider/model/task.dart';

class Todo extends ChangeNotifier{
  List<Task> taskList = [];

  addTaskInList(){
    Task taskModel = Task("title ${taskList.length}", "this is the task no detail ${taskList.length}");
    taskList.add(taskModel);
    notifyListeners();
  }
}