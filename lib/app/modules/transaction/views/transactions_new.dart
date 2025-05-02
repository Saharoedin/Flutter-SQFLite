import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:flutter_sqflite/app/modules/transaction/views/transactions_item.dart';
import 'package:flutter_sqflite/app/modules/transaction/views/transactions_item_add.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionsNew extends StatelessWidget {
  const TransactionsNew({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void showFormBottomSheet(BuildContext context) {
    var controller = Get.put(TransactionController());
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            // borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.only(
            top: 76,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'New Transaction',
                      style: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            CupertinoIcons.clear,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            TransactionsItemAdd().showFormBottomSheet(context);
                          },
                          child: Icon(
                            CupertinoIcons.add_circled,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                  color: Colors.grey.shade100,
                  child: ListView(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.all(16),
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return TransactionsItem();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${NumberFormat.currency(locale: 'id', symbol: 'IDR ').format(1000000)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${NumberFormat.currency(locale: 'id', symbol: 'IDR ').format(1000000)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            'Tax',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${NumberFormat.currency(locale: 'id', symbol: 'IDR ').format(1000000)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            'Grand Total',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${NumberFormat.currency(locale: 'id', symbol: 'IDR ').format(1000000)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      width: Get.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue),
                            padding: WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 32),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            )),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (controller.isNew.value == true) {
                              //
                            } else {
                              //
                            }
                          }
                        },
                        child: Text(
                          '${controller.isNew.value ? 'Checkout' : 'Update'}',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
