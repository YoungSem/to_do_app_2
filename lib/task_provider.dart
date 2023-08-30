import 'package:flutter/foundation.dart';
import 'task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(id: 1, title: 'Купить молоко'),
    TaskModel(id: 2, title: 'Сходить в банк'),
    TaskModel(id: 3, title: 'Посетить спортзал'),
  ];

  List<TaskModel> get tasks => _tasks;

  void addTask(String title) {
    final newTask = TaskModel(id: _tasks.length + 1, title: title);
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTask(int id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    _tasks[taskIndex].isDone = !_tasks[taskIndex].isDone;
    notifyListeners();
  }

  void deleteTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}