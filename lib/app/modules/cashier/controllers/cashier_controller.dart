import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/models/product_master_transaction_model.dart';
import 'package:flutter_sqflite/app/data/models/transaction_detail_model.dart';
import 'package:flutter_sqflite/app/data/providers/category_provider.dart';
import 'package:flutter_sqflite/app/data/providers/product_master_transaction_provider.dart';
import 'package:get/get.dart';

class CashierController extends GetxController {
  var listDetailTransaction = List<ProductMasterTransaction>.empty().obs;
  var listDetailTransactionTemp = List<ProductMasterTransaction>.empty().obs;
  var transactionDetail = TransactionDetail().obs;

  var listProductMasterTransaction = List<ProductMasterTransaction>.empty().obs;
  var listProductMasterTransactionTemp =
      List<ProductMasterTransaction>.empty().obs;
  var productMasterTransaction = ProductMasterTransaction().obs;

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
    listProductMasterTransaction.value =
        await ProductMasterTransactionProvider.fetchData();
    listProductMasterTransactionTemp.value =
        await ProductMasterTransactionProvider.fetchData();
  }

  void fetchCategory() async {
    listCategory.value = await CategoryProvider.fetchData();
    category.value = CategoryModel(id: 0, name: 'Semua');
  }

  void addProductDetail(ProductMasterTransaction detail) {
    listDetailTransaction.add(detail);
  }

  @override
  void onInit() {
    fetchCategory();
    fetchProductMaster();
    super.onInit();
  }
}
