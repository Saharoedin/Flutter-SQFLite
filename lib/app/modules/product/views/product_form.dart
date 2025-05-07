import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/modules/product/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void showFormBottomSheet(BuildContext context) {
    var controller = Get.put(ProductController());
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
                    child: Obx(
                      () => Text(
                        '${controller.isNew.value == true ? 'New Product' : 'Edit Product'}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
                              TextFormFieldCustom(
                                title: 'Name',
                                hintText: 'Enter Product Name',
                                validatorMessage: 'Enter Product Name',
                                controller: controller.txtName,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormFieldCustom(
                                title: 'Description',
                                hintText: 'Enter Product Description',
                                validatorMessage: 'Enter Product Description',
                                controller: controller.txtDescription,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormFieldCustom(
                                      title: 'Price',
                                      hintText: '0',
                                      validatorMessage: 'Enter Product Price',
                                      controller: controller.txtPrice,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: TextFormFieldCustom(
                                      title: 'Discount (%)',
                                      hintText: '0',
                                      validatorMessage:
                                          'Enter Product Discount',
                                      controller: controller.txtDiscount,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Category',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(),
                                ),
                                child: Obx(
                                  () => DropdownButton(
                                    underline: SizedBox(),
                                    dropdownColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 3),
                                    menuWidth: Get.width,
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(12),
                                    hint: Text(
                                      'Select...',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    isExpanded: true,
                                    value: controller.categoryId.value == 0
                                        ? null
                                        : controller.categoryId.value,
                                    items: controller.listCategory.map(
                                      (element) {
                                        return DropdownMenuItem(
                                          value: element.id,
                                          child: Text('${element.name}'),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.categoryId.value =
                                          int.parse('${value}');
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Unit',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(),
                                ),
                                child: Obx(
                                  () => DropdownButton(
                                    underline: SizedBox(),
                                    dropdownColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 3),
                                    menuWidth: Get.width,
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(12),
                                    hint: Text(
                                      'Select...',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    isExpanded: true,
                                    value: controller.unitId.value == 0
                                        ? null
                                        : controller.unitId.value,
                                    items: controller.listUnit.map(
                                      (element) {
                                        return DropdownMenuItem(
                                          value: element.id,
                                          child: Text('${element.name}'),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      controller.unitId.value =
                                          int.parse('${value}');
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Upload Image',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => Container(
                                      margin: EdgeInsets.only(right: 16),
                                      width: 120,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.grey),
                                        image: DecorationImage(
                                          image:
                                              controller.imagePath.value == ''
                                                  ? AssetImage(
                                                      'assets/images/image-folder.jpg',
                                                    )
                                                  : FileImage(
                                                      File(
                                                        '${controller.imagePath.value}',
                                                      ),
                                                    ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.pickImage();
                                      },
                                      child: Row(
                                        children: [
                                          Icon(CupertinoIcons.add_circled),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Add Product Image',
                                              style: TextStyle(
                                                fontSize: 16,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
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
                                    Product(
                                      name: controller.txtName.text,
                                      description:
                                          controller.txtDescription.text,
                                      price: double.parse(
                                          '${controller.txtPrice.text}'),
                                      discount: double.parse(
                                          '${controller.txtDiscount.text}'),
                                      categoryId: controller.categoryId.value,
                                      unitId: controller.unitId.value,
                                      isCustomizable: 1,
                                      imagePath: controller.imagePath.value,
                                      createdAt:
                                          DateTime.now().toIso8601String(),
                                      updatedAt:
                                          DateTime.now().toIso8601String(),
                                    ),
                                  );
                                } else {
                                  controller.updateData(
                                    Product(
                                      id: controller.productMaster.value.id,
                                      name: controller.txtName.text,
                                      description:
                                          controller.txtDescription.text,
                                      price: double.parse(
                                          '${controller.txtPrice.text}'),
                                      discount: double.parse(
                                          '${controller.txtDiscount.text}'),
                                      categoryId: controller.categoryId.value,
                                      unitId: controller.unitId.value,
                                      isCustomizable: 1,
                                      imagePath: controller.imagePath.value,
                                      updatedAt:
                                          DateTime.now().toIso8601String(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              '${controller.isNew.value ? 'Save' : 'Update'}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
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

class TextFormFieldCustom extends StatelessWidget {
  final title, hintText, validatorMessage;
  final TextEditingController controller;
  const TextFormFieldCustom({
    super.key,
    required this.title,
    required this.hintText,
    required this.validatorMessage,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}',
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
            controller: controller,
            validator: (value) {
              if (value == '') return '$validatorMessage';
              return null;
            },
            decoration: InputDecoration(
              hintText: '$hintText',
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
