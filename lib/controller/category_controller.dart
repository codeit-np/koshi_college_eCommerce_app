import 'package:get/get.dart';
import 'package:koshi_app/model/category_model.dart';
import 'package:koshi_app/service/remote_service.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var isLoading = true.obs;

  Future getCategory() async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchCategory();
      if (data != null) {
        categories.value = data;
      }
    } catch (e) {
      Get.snackbar("Merss", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
  }
}
