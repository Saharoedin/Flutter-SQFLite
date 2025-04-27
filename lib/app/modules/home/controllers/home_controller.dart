import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/providers/product_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var listProducts = List<Product>.empty(growable: true).obs;

  void fetchProducts() async {
    listProducts.value = await ProductProvider.fetchProducts();
  }

  void removeProduct(int id) async {
    await ProductProvider.remove(id);
    fetchProducts();
  }

  // void removeDB() async {}

  final count = 0.obs;
  @override
  void onInit() {
    // DbHelper().removeDatabase();
    fetchProducts();
    super.onInit();
  }
}
