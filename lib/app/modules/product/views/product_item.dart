import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onDetail;
  const ProductItem({
    super.key,
    required this.onAdd,
    required this.onDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDetail,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: Border(
          bottom: BorderSide(
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
                      'Paket Geprek Mozarella (Gratis Teh Obeng / Es Kosong)',
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
                      'Nasi (Bisa Ganti Nasi Daun Jeruk) + Ayam Geprek Mozarella + 3 Pilihan Sambal + Lalapan + Minuman',
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
                      '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(35000)}',
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
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage('assets/images/product2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 28,
                        left: 8,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: onAdd,
                            style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(0),
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 40),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                              side: WidgetStatePropertyAll(
                                BorderSide(color: Colors.blue),
                              ),
                            ),
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 12,
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.pencil_outline,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Customizable',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
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
            ],
          ),
        ),
      ),
    );
  }
}
