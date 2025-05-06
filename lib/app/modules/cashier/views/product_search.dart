import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_detail.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_item.dart';
import 'package:get/get.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void showFormBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Container(
          color: Colors.blue,
          padding: EdgeInsets.only(
            top: 56,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          //
                        },
                        decoration: InputDecoration(
                          hintText: 'Type some text here  ...',
                          suffixIcon: Icon(CupertinoIcons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.amber, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 16,
              // ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      // ProductWithCategory product =
                      //     controller.productWithCategories[index];

                      return GestureDetector(
                        onTap: () {
                          // controller.isNew.value = false;
                          // controller.product.value = product;
                          // controller.txtName.text = '${product.name}';
                          // controller.txtDescription.text =
                          //     '${product.description}';
                          // controller.categoryId.value =
                          //     int.parse('${product.categoryId}');
                          // _showFormBottomSheet(context);
                        },
                        child: ProductItem(
                          onAdd: () {
                            print('on add');
                          },
                          onDetail: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) => ProductDetail(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
