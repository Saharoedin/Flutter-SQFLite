import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sqflite/app/data/models/payment_method_model.dart';
import 'package:flutter_sqflite/app/data/providers/payment_method_provider.dart';
import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var listPaymentMethod = List<PaymentMethod>.empty().obs;
  var paymentMethod = PaymentMethod().obs;
  var isNew = false.obs;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtReference = TextEditingController();

  void fetchData() async {
    listPaymentMethod.value = await PaymentMethodProvider.fetchData();
  }

  void clearInput() {
    txtName.clear();
    txtReference.clear();
  }

  void insertData(PaymentMethod data) async {
    await PaymentMethodProvider.insertData(data);
    fetchData();
    Get.back();
    EasyLoading.showSuccess('Data successfully added.');
  }

  void autoFill() {
    txtName.text = '${paymentMethod.value.name}';
    txtReference.text = '${paymentMethod.value.reference}';
  }

  void updateData(PaymentMethod data) async {
    await PaymentMethodProvider.updateData(data);
    fetchData();
    Get.back();
    EasyLoading.showSuccess('Data successfully updated.');
  }

  void deleteData(int id) async {
    await PaymentMethodProvider.deleteData(id);
    fetchData();
    Get.back();
    EasyLoading.showSuccess('Data successfully deleted.');
  }

  final count = 0.obs;
  @override
  void onInit() {
    fetchData();
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

  void increment() => count.value++;
}
