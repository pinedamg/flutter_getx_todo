import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/app/core/utils/keys.dart';
import 'package:todo/app/data/models/todo_item_model.dart';

class StorageService extends GetxService {
  late GetStorage _box;
  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.remove(todoKey);
    var todoItem1 = TodoItemModel(title: "Title 1", done: "0");
    var todoItem2 = TodoItemModel(title: "Title 2", done: "1");
    await _box.writeIfNull(todoKey, jsonEncode([todoItem1, todoItem2]));

    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
