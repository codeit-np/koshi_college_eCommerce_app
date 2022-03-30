import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koshi_app/controller/category_controller.dart';
import 'package:koshi_app/controller/product_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProducController>();
    var categoryController = Get.find<CategoryController>();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Obx(() {
            if (productController.isLoading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Select Menu",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text("Have a fun with our food"),
                    ),
                    SizedBox(
                      width: Get.size.width,
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryController.categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Chip(label: Text(categoryController.categories[index].name));
                        },
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: productController.products.value.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata = productController.products.value.data[index];
                        return ListTile(
                          leading: Image.network(mydata.image),
                          title: Text(mydata.name),
                          subtitle: Text(mydata.description),
                          trailing: Text(
                            "Rs ${mydata.sellingPrice}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          })),
    );
  }
}
