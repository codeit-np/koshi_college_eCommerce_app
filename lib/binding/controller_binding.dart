import 'package:get/get.dart';
import 'package:koshi_app/controller/category_controller.dart';
import 'package:koshi_app/controller/product_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProducController());
    Get.put(CategoryController());
  }
}
