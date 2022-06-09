import 'package:get/get.dart';
import 'package:todo/app/data/providers/todo/provider.dart';
import 'package:todo/app/data/services/storage/repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        todoRepository: TodoRepository(
          todoProvider: TodoProvider(),
        ),
      ),
    );
  }
}
