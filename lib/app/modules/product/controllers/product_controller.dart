import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/providers/category_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_provider.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtCategoryId = TextEditingController();

  var products = List<Product>.empty(growable: true).obs;
  var product = Product().obs;
  var categories = List<CategoryModel>.empty().obs;
  var category = CategoryModel().obs;
  var categoryId = 0.obs;
  var isNew = true.obs;

  void clearForm() {
    txtName.clear();
    txtDescription.clear();
    txtCategoryId.clear();
  }

  void fetchProducts() async {
    products.value = await ProductProvider.fetchProducts();
  }

  void fetchCategories() async {
    categories.value = await CategoryProvider.fetchCategories();
  }

  void insertProduct(Product product) async {
    await ProductProvider.insert(product);
    fetchProducts();
    Get.back();
  }

  void updateProduct(Product product) async {
    await ProductProvider.update(product);
    Get.back();
  }

  void removeProduct(int id) async {
    await ProductProvider.remove(id);
    fetchProducts();
  }

  @override
  void onInit() {
    fetchProducts();
    fetchCategories();
    super.onInit();
  }
}
