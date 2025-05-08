import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_master_model.dart';
import 'package:flutter_sqflite/app/modules/product/controllers/product_controller.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_form.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatelessWidget {
  final ProductMaster product;
  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return ListView(
      padding: EdgeInsets.all(16),
      shrinkWrap: true,
      controller: ScrollController(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
        Container(
          height: 300,
          margin: EdgeInsets.only(bottom: 16, top: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: product.imagePath == ''
                  ? AssetImage('assets/images/product2.jpg')
                  : FileImage(File('${product.imagePath}')),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          '${product.name}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
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
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          '${NumberFormat.currency(
            locale: 'id',
            symbol: 'IDR ',
            decimalDigits: 0,
          ).format(product.price)}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          width: Get.width,
          child: ElevatedButton(
            onPressed: () {
              controller.isNew.value = false;
              controller.productMaster.value = product;
              controller.autoFill();
              ProductForm().showFormBottomSheet(context);
            },
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                )),
            child: Text(
              'Edit Product',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
