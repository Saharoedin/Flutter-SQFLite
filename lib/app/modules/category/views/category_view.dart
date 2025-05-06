import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/modules/category/views/category_item.dart';
import 'package:flutter_sqflite/app/widgets/drawer_custom.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Categories',
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
                _showFormBottomSheet(context);
              },
              child: Icon(
                CupertinoIcons.add,
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
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 8),
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Obx(
                  () => Text(
                    '${controller.categories.length} categories',
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
            child: Obx(() {
              if (controller.categories.isEmpty)
                return Center(
                  child: Text('Data Not Found!'),
                );

              return ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  CategoryModel category = controller.categories[index];
                  return GestureDetector(
                    onTap: () {
                      controller.isNew.value = false;
                      controller.category.value = category;
                      controller.autoFill();
                      _showFormBottomSheet(context);
                    },
                    child: CategoryItem(
                      category: category,
                      controller: controller,
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showFormBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Container(
          color: Colors.blue,
          padding: EdgeInsets.only(
            top: 76,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Text(
                      '${controller.isNew.value == true ? 'New Category' : 'Edit Category'}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            CupertinoIcons.clear,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.only(top: 16),
                            shrinkWrap: true,
                            controller: ScrollController(),
                            children: [
                              Text(
                                'Category Name',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: controller.txtName,
                                validator: (value) {
                                  if (value == '') return 'Enter Category Name';
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter Category Name',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          width: Get.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue),
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (controller.isNew.value == true) {
                                  controller.insertData(
                                    CategoryModel(
                                      name: controller.txtName.text,
                                    ),
                                  );
                                } else {
                                  controller.updateData(
                                    CategoryModel(
                                      id: controller.category.value.id,
                                      name: controller.txtName.text,
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
