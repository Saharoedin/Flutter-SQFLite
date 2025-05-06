import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/category_model.dart';
import 'package:flutter_sqflite/app/modules/category/controllers/category_controller.dart';
import 'package:flutter_sqflite/app/widgets/dialog_confirm.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.controller,
  });

  final CategoryModel category;
  final CategoryController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      title: Text('${category.name}'),
      shape: Border(
        bottom: BorderSide(color: Colors.grey.shade200),
      ),
      trailing: GestureDetector(
        onTap: () => Get.dialog(
          DialogConfirm(
            name: '${category.name}',
            onTap: () => controller.deleteData(
              int.parse('${category.id}'),
            ),
          ),
        ),
        child: Icon(
          CupertinoIcons.trash,
          color: Colors.red,
        ),
      ),
    );
  }
}
