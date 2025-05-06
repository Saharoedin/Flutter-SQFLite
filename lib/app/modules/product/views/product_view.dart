import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_detail.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_form.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_item.dart';
import 'package:flutter_sqflite/app/modules/product/views/product_search.dart';
import 'package:flutter_sqflite/app/widgets/drawer_custom.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Products',
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
      floatingActionButton: GestureDetector(
        onTap: () {
          ProductForm().showFormBottomSheet(context);
        },
        child: Card(
          elevation: 8,
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              CupertinoIcons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
            child: Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.category.value =
                            CategoryModel(id: 0, name: 'Semua');
                        controller.productWithCategories.value =
                            controller.productWithCategoriesTemp;
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
                    ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      controller: ScrollController(),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        CategoryModel category = controller.categories[index];
                        return GestureDetector(
                          onTap: () {
                            controller.category.value = category;
                            controller.productWithCategories.value =
                                controller.productWithCategoriesTemp
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
                  ],
                ),
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
                    '${controller.productWithCategories.length}',
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: Colors.grey.shade200,
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (controller.productWithCategories.isNotEmpty)
                  return Center(
                    child: Text('Data Not Found!'),
                  );

                return ListView.builder(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
