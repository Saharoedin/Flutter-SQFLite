import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/providers/product_provider.dart';
import 'package:flutter_sqflite/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class ProductFormController extends GetxController {
  var homeController = Get.put(HomeController());
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  var product = Product().obs;
  var isUpdate = false.obs;

  void insertData(Product product) async {
    await ProductProvider.insert(product);
    homeController.fetchProducts();
    Get.back();
  }

  void updateData(Product product) async {
    await ProductProvider.update(product);
    homeController.fetchProducts();
    Get.back();
  }

  @override
  void onInit() {
    if (Get.arguments[1] == 'new') {
      isUpdate.value = false;
    } else {
      isUpdate.value = true;
      product.value = Get.arguments[0];
      txtName.text = '${product.value.name}';
      txtDescription.text = '${product.value.description}';
    }
    super.onInit();
  }
}
