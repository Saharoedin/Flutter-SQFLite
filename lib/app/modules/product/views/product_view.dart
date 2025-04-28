import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/data/models/product_with_category_model.dart';
import 'package:flutter_sqflite/app/routes/app_pages.dart';
import 'package:flutter_sqflite/app/widgets/drawer_custom.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller.isNew.value = true;
                controller.clearForm();
                controller.fetchCategories();
                controller.categoryId.value =
                    int.parse('${controller.categories.first.id}');
                _showFormBottomSheet(context);
              },
              child: Icon(
                CupertinoIcons.add_circled,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerCustom(),
      body: Obx(
        () {
          if (controller.productWithCategories.isEmpty)
            return Center(
              child: Text('Data Not Found!'),
            );

          return ListView.builder(
            itemCount: controller.productWithCategories.length,
            itemBuilder: (context, index) {
              ProductWithCategory product =
                  controller.productWithCategories[index];

              return GestureDetector(
                onTap: () {
                  controller.isNew.value = false;
                  controller.product.value = product;
                  controller.txtName.text = '${product.name}';
                  controller.txtDescription.text = '${product.description}';
                  controller.categoryId.value =
                      int.parse('${product.categoryId}');
                  _showFormBottomSheet(context);
                },
                child: ListTile(
                  title: Text('${product.name}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${product.description}'),
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${product.categoryName}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  shape: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      controller.removeProduct(
                        int.parse('${product.id}'),
                      );
                    },
                    child: Icon(CupertinoIcons.clear),
                  ),
                ),
              );
            },
          );
        },
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
                            categoryId: controller.category.value.id,
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
