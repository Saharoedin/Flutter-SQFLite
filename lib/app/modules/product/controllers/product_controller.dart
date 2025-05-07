import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/models/product_master_model.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/models/unit_model.dart';
import 'package:flutter_sqflite/app/data/providers/category_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_master_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_provider.dart';
import 'package:flutter_sqflite/app/data/providers/unit_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtDiscount = TextEditingController();

  var listProductMaster = List<ProductMaster>.empty().obs;
  var listProductMasterTemp = List<ProductMaster>.empty().obs;
  var productMaster = ProductMaster().obs;

  var listCategory = List<CategoryModel>.empty().obs;
  var category = CategoryModel().obs;
  var categoryId = 0.obs;

  var listUnit = List<Unit>.empty().obs;
  var unit = Unit().obs;
  var unitId = 0.obs;

  var isNew = true.obs;
  var imagePath = ''.obs;

  final ImagePicker picker = ImagePicker();

  void clearForm() {
    txtName.clear();
    txtDescription.clear();
    txtPrice.clear();
    txtDiscount.clear();
    categoryId.value = 0;
    unitId.value = 0;
    imagePath.value = '';
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      imageQuality: 70,
      source: ImageSource.gallery,
    );

    if (image != null) {
      imagePath.value = '${image.path}';
    } else {
      print("Tidak ada gambar yang dipilih.");
    }
  }

  void fetchProductMaster() async {
    listProductMaster.value = await ProductMasterProvider.fetchData();
    listProductMasterTemp.value = await ProductMasterProvider.fetchData();
  }

  void fetchCategory() async {
    listCategory.value = await CategoryProvider.fetchData();
    category.value = CategoryModel(id: 0, name: 'Semua');
  }

  void fetchUnit() async {
    listUnit.value = await UnitProvider.fetchData();
  }

  void autoFill() {
    txtName.text = '${productMaster.value.name}';
    txtDescription.text = '${productMaster.value.description}';
    txtPrice.text = '${productMaster.value.price}';
    txtDiscount.text = '${productMaster.value.discount}';
    imagePath.value = '${productMaster.value.imagePath}';
    categoryId.value = int.parse('${productMaster.value.categoryId}');
    unitId.value = int.parse('${productMaster.value.unitId}');
  }

  void insertData(Product product) async {
    await ProductProvider.insertData(product);
    fetchProductMaster();
    Get.back();
    EasyLoading.showSuccess(
      'Data successfully added.',
    );
  }

  void updateData(Product product) async {
    await ProductProvider.updateData(product);
    fetchProductMaster();
    Get.back();
    EasyLoading.showSuccess(
      'Data successfully updated.',
    );
  }

  void deleteData(int id) async {
    await ProductProvider.deleteData(id);
    fetchProductMaster();
    EasyLoading.showSuccess(
      'Data successfully removed.',
    );
  }

  @override
  void onInit() {
    fetchProductMaster();
    fetchCategory();
    fetchUnit();
    super.onInit();
  }
}
