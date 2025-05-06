import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          height: 12,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    size: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.info_circle_fill,
                    size: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Report',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.share,
                    size: 14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Share',
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
        SizedBox(
          height: 32,
        ),
        SizedBox(
          width: Get.width,
          child: ElevatedButton(
            onPressed: () {
              //
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
            ),
            child: Text(
              'Add to cart',
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
