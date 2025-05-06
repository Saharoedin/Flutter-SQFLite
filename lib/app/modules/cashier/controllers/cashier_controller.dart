import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/models/product_with_category_model.dart';
import 'package:flutter_sqflite/app/data/providers/category_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_with_category_provider.dart';
import 'package:get/get.dart';

class CashierController extends GetxController {
  var products = List<Product>.empty(growable: true).obs;
  var productsTemp = List<Product>.empty(growable: true).obs;
  var product = ProductWithCategory().obs;
  var categories = List<CategoryModel>.empty().obs;
  var category = CategoryModel().obs;
  var productWithCategories = List<ProductWithCategory>.empty().obs;
  var productWithCategoriesTemp = List<ProductWithCategory>.empty().obs;

  void fetchProductWithCategory() async {
    productWithCategories.value =
        await ProductWithCategoryProvider.fetchProductWithCategory();
    productWithCategoriesTemp.value =
        await ProductWithCategoryProvider.fetchProductWithCategory();
  }

  void fetchData() async {
    products.value = await ProductProvider.fetchProducts();
    productsTemp.value = await ProductProvider.fetchProducts();
  }

  void fetchCategories() async {
    categories.value = await CategoryProvider.fetchCategories();
    category.value = CategoryModel(id: 0, name: 'Semua');
  }

  @override
  void onInit() {
    fetchProductWithCategory();
    fetchCategories();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
