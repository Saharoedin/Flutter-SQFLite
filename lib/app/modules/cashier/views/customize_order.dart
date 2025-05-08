import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_master_transaction_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomizeOrder extends StatelessWidget {
  final ProductMasterTransaction product;
  const CustomizeOrder({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        controller: ScrollController(),
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              '${product.name}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            controller: ScrollController(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produk',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(product.price)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 16,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Edit')
                  ],
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                CupertinoIcons.minus_circle,
                color: Colors.blue,
              ),
              SizedBox(
                width: 8,
              ),
              Text('${NumberFormat.decimalPattern().format(product.picked)}'),
              SizedBox(
                width: 8,
              ),
              Icon(
                CupertinoIcons.add_circled,
                color: Colors.blue,
              ),
              SizedBox(
                width: 16,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: Get.width,
            child: ElevatedButton(
              onPressed: () {
                //
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              child: Text(
                'Customize another',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
