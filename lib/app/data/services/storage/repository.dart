import 'package:todo/app/data/models/todo_item_model.dart';
import 'package:todo/app/data/providers/todo/provider.dart';

class TodoRepository {
  TodoProvider todoProvider;

  TodoRepository({
    required this.todoProvider,
  });

  List<TodoItemModel> readTodos() => todoProvider.readTodos();

  void writeTodos(List<TodoItemModel> todos) => todoProvider.writeTodo(todos);

  // getAll() {
  //   return api.getAll();
  // }

  // getId(id) {
  //   return api.getId(id);
  // }

  // delete(id) {
  //   return api.delete(id);
  // }

  // edit(obj) {
  //   return api.edit(obj);
  // }

  // add(obj) {
  //   return api.add(obj);
  // }
}
