import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';
import 'package:todo/app/data/models/todo_item_model.dart';
import '../controllers/home_controller.dart';

enum ListStatuses {
  All,
  Done,
  UnDone;
}

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX TODO'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              onSelected: (status) => controller.filterList(status),
              icon: Icon(Icons.filter_list),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                    child: Text('All'), value: ListStatuses.All),
                const PopupMenuItem(
                    child: Text('Done'), value: ListStatuses.Done),
                const PopupMenuItem(
                    child: Text('UnDone'), value: ListStatuses.UnDone)
              ],
            )
          ],
        ),
        body: SafeArea(child: Center(
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.todoList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: CheckboxListTile(
                    title: Text('${controller.todoList[index].title}'),
                    value: toBoolean(controller.todoList[index].done),
                    onChanged: (value) => controller.updateTodo(index, value!),
                  ),
                );
              },
            );
          }),
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => controller.todoList
              .add(TodoItemModel.fromJson({"title": "Title", "done": "1"})),
        ));
  }
}
