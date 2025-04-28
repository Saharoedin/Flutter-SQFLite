import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () => Get.toNamed(Routes.CATEGORY),
                child: Text('Categories')),
            TextButton(
                onPressed: () => Get.toNamed(Routes.PRODUCT),
                child: Text('Products')),
            TextButton(
                onPressed: () => Get.toNamed(Routes.TRANSACTION),
                child: Text('Transactions')),
          ],
        ),
      ),
    );
  }
}
