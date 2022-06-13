import 'package:todo/app/data/models/todo_item_model.dart';
import 'package:todo/app/data/providers/todo/provider.dart';

class TodoRepository {
  TodoProvider todoProvider;

  TodoRepository({
    required this.todoProvider,
  });

  List<TodoItemModel> readTodos() => todoProvider.readTodos();

  void writeTodos(List<TodoItemModel> todos) => todoProvider.writeTodos(todos);

  addTodo(TodoItemModel todoItem) =>
      todoProvider.addTodo(todoItem.title, todoItem.done);

  void remoteTodo(int index) {
    var todos = readTodos();
    todos.removeAt(index);
    writeTodos(todos);
  }
}
