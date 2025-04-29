import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/widgets/drawer_custom.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Obx(() {
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
                controller.category.value = category;
                controller.isNew.value = false;
                controller.txtName.text = '${category.name}';
                _showFormBottomSheet(context);
              },
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                title: Text('${category.name}'),
                shape: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
                trailing: GestureDetector(
                  onTap: () =>
                      controller.removeCategory(int.parse('${category.id}')),
                  child: Icon(
                    CupertinoIcons.clear,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void _showFormBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // <-- Supaya naik saat keyboard muncul
          ),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(CupertinoIcons.clear),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'FORM CATEGORY',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            controller: controller.txtName,
                            validator: (value) {
                              if (value == '') return 'Enter category name';
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text('Category Name'),
                            ),
                          ),
                        ]),
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
                        controller.insertCategory(
                          CategoryModel(
                            name: controller.txtName.text,
                          ),
                        );
                      } else {
                        controller.updateCategory(
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
              SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
