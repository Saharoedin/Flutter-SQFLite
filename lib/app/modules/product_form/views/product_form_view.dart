import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';

import 'package:get/get.dart';

import '../controllers/product_form_controller.dart';

class ProductFormView extends GetView<ProductFormController> {
  const ProductFormView({super.key});
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Form'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        controller: ScrollController(),
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: controller.txtName,
                      validator: (value) {
                        if (value == '') return 'Enter product name';
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text('Name'),
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: controller.txtDescription,
                    validator: (value) {
                      if (value == '') return 'Enter product description';

                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text('Description'),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (controller.isUpdate.value == false) {
                          controller.insertData(
                            Product(
                              name: controller.txtName.text,
                              description: controller.txtDescription.text,
                              createdAt: DateTime.now().toIso8601String(),
                              updatedAt: DateTime.now().toIso8601String(),
                            ),
                          );
                        } else {
                          controller.updateData(
                            Product(
                              id: controller.product.value.id,
                              name: controller.txtName.text,
                              description: controller.txtDescription.text,
                              updatedAt: DateTime.now().toIso8601String(),
                            ),
                          );
                        }
                      }
                    },
                    child: Text('Save'),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
