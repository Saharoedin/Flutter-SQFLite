import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/product_model.dart';
import 'package:flutter_sqflite/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.PRODUCT_FORM,
                    arguments: [Product(), 'new'],
                  );
                },
                child: Icon(CupertinoIcons.add)),
          ),
        ],
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
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Obx(() => ListView.builder(
              itemCount: controller.listProducts.length,
              itemBuilder: (context, index) {
                Product product = controller.listProducts[index];

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.PRODUCT_FORM,
                      arguments: [product, 'update'],
                    );
                  },
                  child: ListTile(
                    title: Text('${product.name}'),
                    subtitle: Text('${product.description}'),
                    trailing: GestureDetector(
                        onTap: () {
                          controller.removeProduct(
                            int.parse('${product.id}'),
                          );
                        },
                        child: Icon(CupertinoIcons.clear)),
                  ),
                );
              },
            )),
      ),
    );
  }
}
