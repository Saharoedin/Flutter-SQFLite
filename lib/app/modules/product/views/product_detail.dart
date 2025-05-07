import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_form.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
              image: AssetImage('assets/images/product2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Paket Geprek Mozarella (Gratis Teh Obeng / Es Kosong)',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Nasi (Bisa Ganti Nasi Daun Jeruk) + Ayam Geprek Mozarella + 3 Pilihan Sambal + Lalapan + Minuman',
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
          ).format(35000)}',
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
