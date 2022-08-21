import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoPrivder with ChangeNotifier {
  List<TodoModel> _todolist = [];
  List<TodoModel> get todolist => _todolist;

  void addTodo(TodoModel todo) {
    _todolist.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todolist = _todolist.where((item) => item.id != todo.id).toList();
    notifyListeners();
  }

  void updateTodo(TodoModel todo) {
    _todolist[_todolist.indexWhere((item) => item.id != todo.id)] = todo;
    notifyListeners();
  }
}
