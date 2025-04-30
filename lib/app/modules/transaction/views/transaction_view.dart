import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Transactions',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                _showFormBottomSheet(context);
              },
              child: Icon(
                CupertinoIcons.add_circled,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.txtStartDate,
                      decoration: InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.calendar),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller.txtEndDate,
                      decoration: InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.calendar),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Transactions',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Obx(
                    () => Text(
                      '${controller.transactions.length}',
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.transactions.isEmpty)
                  return Center(
                    child: Text('No transaction yet.'),
                  );

                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        'TRANS000${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text(
                        '28/04/2025 08:00:00',
                      ),
                      shape: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      trailing: Text(
                        'Rp 100.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _showFormBottomSheet(BuildContext context) {
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
              Text(
                'New Transaction',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade200,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              // Container(
              //   color: Colors.transparent,
              //   padding: EdgeInsets.all(16),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Transaction No',
              //               style: TextStyle(fontSize: 16, color: Colors.white),
              //             ),
              //             SizedBox(
              //               height: 8,
              //             ),
              //             TextFormField(
              //               controller: controller.txtTransactionNo,
              //               decoration: InputDecoration(
              //                 fillColor: Colors.white,
              //                 filled: true,
              //                 border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(12),
              //                   borderSide: BorderSide.none,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 16,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Date',
              //               style: TextStyle(fontSize: 16, color: Colors.white),
              //             ),
              //             SizedBox(
              //               height: 8,
              //             ),
              //             TextFormField(
              //               controller: controller.txtTransactionDate,
              //               decoration: InputDecoration(
              //                 suffixIcon: Icon(CupertinoIcons.calendar),
              //                 fillColor: Colors.white,
              //                 filled: true,
              //                 border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(12),
              //                   borderSide: BorderSide.none,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.only(
              //     left: 16,
              //     right: 16,
              //     bottom: 16,
              //   ),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Items',
              //         style: TextStyle(
              //           fontSize: 16,
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       Spacer(),
              //       GestureDetector(
              //         onTap: () {
              //           //
              //         },
              //         child: Container(
              //           child: Row(
              //             children: [
              //               Icon(
              //                 CupertinoIcons.add,
              //                 size: 20,
              //                 color: Colors.white,
              //               ),
              //               SizedBox(
              //                 width: 6,
              //               ),
              //               Text(
              //                 'Add Item',
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
                          return Item();
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
                          style: TextStyle(color: Colors.white),
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

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Produk',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'Elektronik',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '${NumberFormat.currency(locale: 'id', symbol: 'IDR ').format(1000)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                CupertinoIcons.trash,
                color: Colors.orange,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 25,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Icon(
                        CupertinoIcons.minus,
                        size: 18,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Icon(
                        CupertinoIcons.add,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
