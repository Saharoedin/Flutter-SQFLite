import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              TextButton(
                  onPressed: () => Get.toNamed(Routes.HOME),
                  child: Text('Products')),
              TextButton(
                  onPressed: () => Get.toNamed(Routes.CATEGORY),
                  child: Text('Categories')),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'CategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
