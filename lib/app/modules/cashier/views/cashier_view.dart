import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/models/product_master_model.dart';
import 'package:flutter_sqflite/app/data/models/product_master_transaction_model.dart';
import 'package:flutter_sqflite/app/data/models/transaction_detail_model.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/cart_order.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/customize_order.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/detail_order.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/product_detail.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/product_item.dart';
import 'package:flutter_sqflite/app/modules/cashier/views/product_search.dart';
import 'package:flutter_sqflite/app/widgets/drawer_custom.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../controllers/cashier_controller.dart';

class CashierView extends GetView<CashierController> {
  const CashierView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Cashier',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) => CartOrder(),
                );
              },
              child: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                controller.fetchProductMaster();
                ProductSearch().showFormBottomSheet(context);
              },
              child: Icon(
                CupertinoIcons.search,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerCustom(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16, top: 16),
            height: 34,
            width: Get.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.category.value =
                          CategoryModel(id: 0, name: 'Semua');
                      controller.listProductMasterTransactionTemp.value =
                          controller.listProductMasterTransaction;
                    },
                    child: Obx(
                      () => Container(
                        margin: EdgeInsets.only(left: 16),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: controller.category.value.id == 0
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Text(
                          'Semua',
                          style: TextStyle(
                            color: controller.category.value.id == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      controller: ScrollController(),
                      itemCount: controller.listCategory.length,
                      itemBuilder: (context, index) {
                        CategoryModel category = controller.listCategory[index];
                        return GestureDetector(
                          onTap: () {
                            controller.category.value = category;
                            controller.listProductMasterTransactionTemp.value =
                                controller.listProductMasterTransaction
                                    .where(
                                      (dt) => dt.categoryId == category.id,
                                    )
                                    .toList();
                          },
                          child: Obx(
                            () => Container(
                              margin: EdgeInsets.only(left: 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color:
                                    controller.category.value.id == category.id
                                        ? Colors.blue
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blue),
                              ),
                              child: Text(
                                '${category.name}',
                                style: TextStyle(
                                  color: controller.category.value.id ==
                                          category.id
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Obx(
                  () => Text(
                    '${controller.listProductMasterTransactionTemp.length}',
                    style: TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.listProductMasterTransactionTemp.isEmpty)
                  return Center(
                    child: Container(
                      width: Get.width * 0.7,
                      child: LottieBuilder.asset(
                        'assets/lotties/empty.json',
                      ),
                    ),
                  );

                return ListView.builder(
                  shrinkWrap: true,
                  controller: ScrollController(),
                  itemCount: controller.listProductMasterTransactionTemp.length,
                  itemBuilder: (context, index) {
                    ProductMasterTransaction product =
                        controller.listProductMasterTransactionTemp[index];

                    return GestureDetector(
                      onTap: () {
                        controller.productMasterTransaction.value = product;
                      },
                      child: ProductItem(
                        product: product,
                        onAdd: () {
                          if (product.picked == 0) {
                            product.picked = (product.picked ?? 0) + 1;
                            controller.listProductMasterTransactionTemp
                                .refresh();
                            controller.addProductDetail(product);
                          } else {
                            if (product.isCustomizable == 1) {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) => CustomizeOrder(
                                  product: product,
                                ),
                              );
                            } else {
                              product.picked = (product.picked ?? 0) + 1;
                              controller.listProductMasterTransactionTemp
                                  .refresh();
                            }
                          }
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
                );
              },
            ),
          ),
          Obx(
            () => controller.listDetailTransaction.isEmpty
                ? SizedBox()
                : Container(
                    padding: EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: 24,
                    ),
                    color: Colors.grey.shade100,
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grand Total',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(1000)}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.blue,
                              context: context,
                              builder: (context) => DetailOrder(),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.blue,
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              )),
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
