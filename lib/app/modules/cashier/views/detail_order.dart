import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/product_item_detail.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailOrder extends StatelessWidget {
  const DetailOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.only(
        top: 76,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: Text(
                  'Detail Order',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 16),
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                controller: ScrollController(),
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      'Order Type',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(
                            Icons.restaurant,
                            color: Colors.blue,
                            size: 20,
                          ),
                          title: Text(
                            'Dine In',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Meals are served directly at the table.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          trailing: Icon(
                            CupertinoIcons.circle,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(
                            Icons.motorcycle_outlined,
                            color: Colors.blue,
                          ),
                          title: Text(
                            'Takeaway',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Meals are packed to enjoy elsewhere conveniently.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          trailing: Icon(
                            CupertinoIcons.circle,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //
                        },
                        child: ProductItemDetail(
                          onAdd: () {
                            print('on add');
                          },
                          onDetail: () {
                            //
                          },
                        ),
                      );
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Need anything else?',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Add other dishes, if you want.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        OutlinedButton(
                          onPressed: () {
                            //
                          },
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      'Payment Summary',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Total',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(1000)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(1000)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(1000)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Grand Total',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(1000)}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(
                    CupertinoIcons.creditcard,
                    color: Colors.blue,
                    size: 20,
                  ),
                  title: Text(
                    'Cash',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: Text(
                    '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(1000)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(
                    CupertinoIcons.ellipsis_circle_fill,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                    ),
                    onPressed: () {
                      //
                    },
                    child: Text(
                      'Purchase Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
