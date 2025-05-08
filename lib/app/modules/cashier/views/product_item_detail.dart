import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_master_transaction_model.dart';
import 'package:flutter_sqflite/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductItemDetail extends StatelessWidget {
  final ProductMasterTransaction product;
  final VoidCallback onAdd;
  final VoidCallback onDetail;
  const ProductItemDetail({
    super.key,
    required this.product,
    required this.onAdd,
    required this.onDetail,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CashierController());
    return GestureDetector(
      onTap: onDetail,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
        color: Colors.white,
        child: Container(
          height: 170,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(product.price)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade800,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade200,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                size: 14,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Edit',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: product.imagePath == ''
                                ? AssetImage('assets/images/image-folder.jpg')
                                : FileImage(
                                    File('${product.imagePath}'),
                                  ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              product.picked = (product.picked ?? 0) - 1;
                              controller.listDetailTransaction.refresh();
                            },
                            child: Icon(
                              CupertinoIcons.minus_circle,
                              color: Colors.blue,
                              size: 28,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            '${NumberFormat.decimalPattern().format(product.picked)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              product.picked = (product.picked ?? 0) + 1;
                              controller.listDetailTransaction.refresh();
                            },
                            child: Icon(
                              CupertinoIcons.add_circled,
                              color: Colors.blue,
                              size: 28,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
