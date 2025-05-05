import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/helpers/db_helper.dart';
import 'package:flutter_sqflite/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wine_bar_outlined,
                  size: 32,
                ),
                Text(
                  'kopi',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'senja',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              color: Colors.grey.shade200,
              child: Text(
                'Transaction',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(Routes.CASHIER),
              child: Text(
                'Cashier',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Get.toNamed(Routes.REPORT),
              child: Text(
                'Report',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 12,
              ),
              color: Colors.grey.shade200,
              child: Text(
                'Data Master',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(Routes.UNIT),
              child: Text(
                'Units',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Get.toNamed(Routes.CATEGORY),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Get.toNamed(Routes.PRODUCT),
              child: Text(
                'Products',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 12,
              ),
              color: Colors.grey.shade200,
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //
              },
              child: Text(
                'Backup Data',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                DbHelper().removeDatabase();
              },
              child: Text(
                'Remove Database',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Get.toNamed(Routes.ACCOUNT),
              child: Text(
                'Akun',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
