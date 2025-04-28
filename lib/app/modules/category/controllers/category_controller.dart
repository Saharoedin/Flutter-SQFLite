import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/providers/category_provider.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  TextEditingController txtName = TextEditingController();
  var categories = List<CategoryModel>.empty().obs;
  var category = CategoryModel().obs;
  var isNew = true.obs;

  void clearForm() {
    txtName.clear();
  }

  void fetchCategory() async {
    categories.value = await CategoryProvider.fetchCategories();
  }

  void insertCategory(CategoryModel category) async {
    await CategoryProvider.insert(category);
    fetchCategory();
    Get.back();
  }

  void updateCategory(CategoryModel category) async {
    await CategoryProvider.update(category);
    fetchCategory();
    Get.back();
  }

  void removeCategory(int id) async {
    await CategoryProvider.remove(id);
    fetchCategory();
  }

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }
}
