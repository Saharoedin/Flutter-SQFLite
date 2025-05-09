import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_master_model.dart';
import 'package:flutter_sqflite/app/data/models/product_master_transaction_model.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final ProductMasterTransaction product;
  final VoidCallback onAdd;
  final VoidCallback onDetail;
  const ProductItem({
    super.key,
    required this.product,
    required this.onAdd,
    required this.onDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDetail,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: Border(
          top: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
        color: Colors.white,
        child: Container(
          height: 200,
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${product.description}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade800,
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
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: 14,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '8 people like this',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade800,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                flex: 1,
                child: Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: product.imagePath == ''
                                      ? AssetImage(
                                          'assets/images/image-folder.jpg')
                                      : FileImage(
                                          File('${product.imagePath}'),
                                        ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Container()),
                            ElevatedButton(
                              onPressed: onAdd,
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(0),
                                padding: WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(
                                    horizontal: product.picked == 0 ? 36 : 24,
                                  ),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.white,
                                ),
                                side: WidgetStatePropertyAll(
                                  BorderSide(color: Colors.blue),
                                ),
                              ),
                              child: Text(
                                product.picked == 0
                                    ? 'Add'
                                    : '${NumberFormat.decimalPattern().format(product.picked)} items',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.pencil_outline,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  product.isCustomizable == 1
                                      ? 'Customizable'
                                      : 'Uncustomizable',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
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
            ],
          ),
        ),
      ),
    );
  }
}
