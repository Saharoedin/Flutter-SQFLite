import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sqflite/app/data/models/unit_model.dart';
import 'package:flutter_sqflite/app/data/providers/unit_provider.dart';
import 'package:get/get.dart';

class UnitController extends GetxController {
  TextEditingController txtName = TextEditingController();
  var units = List<Unit>.empty().obs;
  var unit = Unit().obs;

  var isNew = true.obs;

  void fetchData() async {
    units.value = await UnitProvider.fetchData();
  }

  void clearInput() {
    txtName.clear();
  }

  void autoFill() {
    txtName.text = '${unit.value.name}';
  }

  void insertData(Unit data) async {
    await UnitProvider.insertData(data);
    fetchData();
    clearInput();
    Get.back();
    EasyLoading.showSuccess(
      'Data successfully added.',
    );
  }

  void updateData(Unit data) async {
    await UnitProvider.updateData(data);
    fetchData();
    clearInput();
    Get.back();
    EasyLoading.showSuccess(
      'Data successfully updated.',
    );
  }

  void deleteData(int id) async {
    await UnitProvider.deleteData(id);
    fetchData();
    Get.back();
    EasyLoading.showSuccess(
      'Data successfully removed.',
    );
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
