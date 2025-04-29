import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/models/product_with_category_model.dart';
import 'package:flutter_sqflite/app/data/providers/category_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_with_category_provider.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtCategoryId = TextEditingController();

  var products = List<Product>.empty(growable: true).obs;
  var productsTemp = List<Product>.empty(growable: true).obs;
  var product = ProductWithCategory().obs;
  var categories = List<CategoryModel>.empty().obs;
  var category = CategoryModel().obs;
  var productWithCategories = List<ProductWithCategory>.empty().obs;
  var productWithCategoriesTemp = List<ProductWithCategory>.empty().obs;

  var categoryId = 0.obs;
  var isNew = true.obs;

  void clearForm() {
    txtName.clear();
    txtDescription.clear();
    txtCategoryId.clear();
  }

  void fetchProductWithCategory() async {
    productWithCategories.value =
        await ProductWithCategoryProvider.fetchProductWithCategory();
    productWithCategoriesTemp.value =
        await ProductWithCategoryProvider.fetchProductWithCategory();
  }

  void fetchProducts() async {
    products.value = await ProductProvider.fetchProducts();
    productsTemp.value = await ProductProvider.fetchProducts();
  }

  void fetchCategories() async {
    categories.value = await CategoryProvider.fetchCategories();
    category.value = CategoryModel(id: 0, name: 'Semua');
  }

  void insertProduct(Product product) async {
    await ProductProvider.insert(product);
    fetchProductWithCategory();
    Get.back();
  }

  void updateProduct(Product product) async {
    await ProductProvider.update(product);
    fetchProductWithCategory();
    Get.back();
  }

  void removeProduct(int id) async {
    await ProductProvider.remove(id);
    fetchProductWithCategory();
  }

  @override
  void onInit() {
    fetchCategories();
    fetchProductWithCategory();
    super.onInit();
  }
}
