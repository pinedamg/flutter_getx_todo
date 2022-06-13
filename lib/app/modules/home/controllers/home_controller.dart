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

  void addTodo(String title, String done) {
    TodoItemModel todoItem = TodoItemModel(title: title, done: done);
    todoRepository.addTodo(todoItem);
    todoList.add(todoItem);
  }

  filterList(status) {
    todoList.assignAll(todoRepository.readTodos());
    switch (status) {
      case ListStatuses.Done:
        todoList.retainWhere((item) => item.done == "1");
        break;
      case ListStatuses.UnDone:
        todoList.retainWhere((item) => item.done == "0");
        break;
    }
  }
}
