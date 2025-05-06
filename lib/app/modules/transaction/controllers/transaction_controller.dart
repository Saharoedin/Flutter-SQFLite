import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/models/transaction_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  var products = List<Product>.empty().obs;
  var transactions = List<TransactionModel>.empty().obs;
  var transactionsTemp = List<TransactionModel>.empty().obs;
  var transaction = TransactionModel().obs;

  TextEditingController txtStartDate = TextEditingController();
  TextEditingController txtEndDate = TextEditingController();
  TextEditingController txtTransactionNo = TextEditingController();
  TextEditingController txtTransactionDate = TextEditingController();

  var isNew = true.obs;

  void fetchTransactions() async {
    //
  }

  void insertTransaction() async {
    //
  }

  void updateTransaction() {
    //
  }

  void removeTransaction() {
    //
  }

  @override
  void onInit() {
    fetchTransactions();
    txtStartDate.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    txtEndDate.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    txtTransactionDate.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.onInit();
  }
}
