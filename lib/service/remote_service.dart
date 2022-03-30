import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:koshi_app/model/category_model.dart';
import 'package:koshi_app/model/product_model.dart';

class RemoteService {
  static var clinet = http.Client();
  static String baseURL = "http://192.168.1.61:8000/api";
  //Get Product From Our Server
  static Future fetchProduct() async {
    try {
      var response = await clinet.get(Uri.parse("$baseURL/products"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }

  //Get Category from our server
  static Future fetchCategory() async {
    try {
      var response = await clinet.get(Uri.parse("$baseURL/category"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return categoryModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }
}
