import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_validator/string_validator.dart';
import 'package:todo/app/data/models/todo_item_model.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItemModel todoItemModel;
  const TodoItemWidget(this.todoItemModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) => Get.snackbar(
                'Hi',
                'i am a modern snackbar',
              ),
            )
          ],
        ),
        Row(
          children: [Text("${todoItemModel.title}")],
        ),
      ],
    ));
  }
}
