import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/models/product_master_model.dart';
import 'package:flutter_sqflite/app/data/models/transaction_detail_model.dart';
import 'package:flutter_sqflite/app/data/providers/category_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_master_provider.dart';
import 'package:get/get.dart';

class CashierController extends GetxController {
  var listDetailTransaction = List<TransactionDetail>.empty().obs;
  var listDetailTransactionTemp = List<TransactionDetail>.empty().obs;
  var transactionDetail = TransactionDetail().obs;

  var listProductMaster = List<ProductMaster>.empty().obs;
  var listProductMasterTemp = List<ProductMaster>.empty().obs;
  var productMaster = ProductMaster().obs;

  var listCategory = List<CategoryModel>.empty().obs;
  var listCategoryTemp = List<CategoryModel>.empty().obs;
  var category = CategoryModel().obs;

  var orderStatus = 'All Orders'.obs;
  var listOrderStatus = [
    'All Orders',
    'Ordering',
    'Placed',
    'Cooking',
    'Ready',
    'Served',
    'Unpaid',
    'Paid'
  ];

  void fetchProductMaster() async {
    listProductMaster.value = await ProductMasterProvider.fetchData();
    listProductMasterTemp.value = await ProductMasterProvider.fetchData();
  }

  void fetchCategory() async {
    listCategory.value = await CategoryProvider.fetchData();
    category.value = CategoryModel(id: 0, name: 'Semua');
  }

  @override
  void onInit() {
    fetchCategory();
    fetchProductMaster();
    super.onInit();
  }
}
