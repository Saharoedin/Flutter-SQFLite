import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/models/product_with_category_model.dart';
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
      floatingActionButton: Card(
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

  void _showFormBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            top: 76,
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Text(
                'New Product',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: controller.txtName,
                        validator: (value) {
                          if (value == '') return 'Enter product name';
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Product Name'),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: controller.txtDescription,
                        validator: (value) {
                          if (value == '') return 'Enter product description';
                          return null;
                        },
                        decoration: InputDecoration(
                          label: Text('Product Description'),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Product Category'),
                      Obx(
                        () => DropdownButton(
                          padding: EdgeInsets.all(0),
                          menuWidth: Get.width,
                          borderRadius: BorderRadius.circular(12),
                          hint: Text('Select...'),
                          isExpanded: true,
                          value: controller.categoryId.value == 0
                              ? null
                              : controller.categoryId.value,
                          items: controller.categories.map(
                            (element) {
                              return DropdownMenuItem(
                                value: element.id,
                                child: Text('${element.name}'),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            controller.categoryId.value = int.parse('${value}');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                width: Get.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (controller.isNew.value == true) {
                        controller.insertProduct(
                          Product(
                            name: controller.txtName.text,
                            description: controller.txtDescription.text,
                            categoryId: controller.categoryId.value,
                            createdAt: DateTime.now().toIso8601String(),
                            updatedAt: DateTime.now().toIso8601String(),
                          ),
                        );
                      } else {
                        controller.updateProduct(
                          Product(
                            id: controller.product.value.id,
                            name: controller.txtName.text,
                            description: controller.txtDescription.text,
                            categoryId: controller.categoryId.value,
                            updatedAt: DateTime.now().toIso8601String(),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    '${controller.isNew.value ? 'Save' : 'Update'}',
                    style: TextStyle(color: Colors.white),
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
