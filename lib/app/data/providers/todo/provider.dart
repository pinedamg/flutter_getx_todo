import 'dart:convert';
import 'package:get/get.dart';
import 'package:todo/app/core/utils/keys.dart';
import 'package:todo/app/data/models/todo_item_model.dart';
import 'package:todo/app/data/services/storage/services.dart';

class TodoProvider {
  final StorageService _storage = Get.find<StorageService>();

  List<TodoItemModel> readTodos() {
    var todos = <TodoItemModel>[];
    jsonDecode(_storage.read(todoKey).toString())
        .forEach((e) => todos.add(TodoItemModel.fromJson(e)));
    return todos;
  }

  void writeTodo(List<TodoItemModel> todos) {
    _storage.write(todoKey, jsonEncode(todos));
  }
}
