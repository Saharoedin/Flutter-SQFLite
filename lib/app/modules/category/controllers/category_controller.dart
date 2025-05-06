import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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

  void insertData(CategoryModel category) async {
    await CategoryProvider.insert(category);
    fetchCategory();
    Get.back();
    EasyLoading.showSuccess(
      'Data successfully added.',
    );
  }

  void autoFill() {
    txtName.text = '${category.value.name}';
  }

  void updateData(CategoryModel category) async {
    await CategoryProvider.update(category);
    fetchCategory();
    Get.back();
    EasyLoading.showSuccess(
      'Data successfully updated.',
    );
  }

  void deleteData(int id) async {
    await CategoryProvider.remove(id);
    fetchCategory();
    Get.back();
    EasyLoading.showSuccess(
      'Data successfully removed.',
    );
  }

  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }
}
