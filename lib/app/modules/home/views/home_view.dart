import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';
import 'package:todo/app/data/models/todo_item_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX TODO'),
          centerTitle: true,
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
