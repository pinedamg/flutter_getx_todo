import 'package:get/get.dart';

import 'package:todo/app/data/models/todo_item_model.dart';
import 'package:todo/app/data/services/storage/repository.dart';
import 'package:todo/app/modules/home/views/home_view.dart';

class HomeController extends GetxController {
  TodoRepository todoRepository;
  final todoList = <TodoItemModel>[].obs;
  HomeController({
    required this.todoRepository,
  });

  @override
  void onInit() {
    super.onInit();
    todoList.assignAll(todoRepository.readTodos());
    ever(todoList, (_) => todoRepository.writeTodos(todoList));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateTodo(index, bool value) {
    todoList[index].done = value ? "1" : "0";
    todoList.refresh();
  }

  filterList(status) {
    switch (status) {
      case ListStatuses.All:
        todoList.assignAll(todoList.toList());
        break;
      case ListStatuses.Done:
        todoList.assignAll(todoList.where((item) => item.done == "1").toList());
        break;
      case ListStatuses.UnDone:
        todoList.assignAll(todoList.where((item) => item.done == "0").toList());
        break;
    }
    todoList.refresh();
  }
}
