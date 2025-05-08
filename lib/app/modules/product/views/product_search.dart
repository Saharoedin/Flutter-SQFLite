import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_master_model.dart';
import 'package:flutter_sqflite/app/modules/product/controllers/product_controller.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_detail.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_form.dart';
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
    var controller = Get.put(ProductController());
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
                      onTap: () {
                        controller.fetchProductMaster();
                        Get.back();
                      },
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
                          controller.listProductMasterTemp.value =
                              controller.listProductMaster
                                  .where(
                                    (dt) => dt.name!
                                        .isCaseInsensitiveContainsAny(value),
                                  )
                                  .toList();
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
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.listProductMasterTemp.length,
                      itemBuilder: (context, index) {
                        ProductMaster product =
                            controller.listProductMasterTemp[index];
                        return GestureDetector(
                          onTap: () {
                            controller.isNew.value = false;
                            controller.productMaster.value = product;
                            controller.autoFill();
                            ProductForm().showFormBottomSheet(context);
                          },
                          child: ProductItem(
                            product: product,
                            onEdit: () {
                              print('on add');
                            },
                            onDetail: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) => ProductDetail(
                                  product: product,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
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
