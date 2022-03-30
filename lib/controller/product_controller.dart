import 'package:get/get.dart';
import 'package:koshi_app/model/product_model.dart';
import 'package:koshi_app/service/remote_service.dart';

class ProducController extends GetxController {
  var products = ProductModel(data: []).obs;
  var isLoading = true.obs;

  Future getProducts() async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchProduct();
      if (data != null) {
        products.value = data;
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
    getProducts();
  }
}
