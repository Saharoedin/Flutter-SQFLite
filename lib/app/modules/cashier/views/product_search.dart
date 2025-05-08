import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_master_model.dart';
import 'package:flutter_sqflite/app/data/models/product_master_transaction_model.dart';
import 'package:flutter_sqflite/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/product_detail.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/product_item.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void showFormBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var controller = Get.put(CashierController());
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
                          controller.listProductMasterTransactionTemp.value =
                              controller.listProductMasterTransaction
                                  .where(
                                    (dt) => dt.name!
                                        .isCaseInsensitiveContainsAny(value),
                                  )
                                  .toList();
                        },
                        decoration: InputDecoration(
                          hintText: 'Type some text here  ...',
                          hintStyle: TextStyle(fontWeight: FontWeight.normal),
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
                    () => controller.listProductMasterTransactionTemp.isEmpty
                        ? Center(
                            child: Container(
                              width: Get.width * 0.7,
                              child: LottieBuilder.asset(
                                'assets/lotties/empty.json',
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            itemCount: controller
                                .listProductMasterTransactionTemp.length,
                            itemBuilder: (context, index) {
                              ProductMasterTransaction product = controller
                                  .listProductMasterTransactionTemp[index];

                              return GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: ProductItem(
                                  product: product,
                                  onAdd: () {
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
