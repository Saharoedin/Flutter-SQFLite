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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 73, bottom: 16),
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wine_bar_outlined,
                  color: Colors.white,
                ),
                Text(
                  'Kopi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Senja',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              controller: ScrollController(),
              children: [
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(12),
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
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.CASHIER),
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.person),
                    title: Text(
                      'Cashier',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.STOCK),
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.cube),
                    title: Text(
                      'Stocks',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.STOCK),
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.graph_square),
                    title: Text(
                      'Report',
                      style: TextStyle(
                        color: Colors.black,
                      ),
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
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.UNIT),
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.pin),
                    title: Text(
                      'Units',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.CATEGORY),
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.pin),
                    title: Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.PRODUCT),
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.cube_box),
                    title: Text(
                      'Products',
                      style: TextStyle(
                        color: Colors.black,
                      ),
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
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.UNIT),
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.square_line_vertical_square),
                    title: Text(
                      'Backup Database',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await DbHelper().removeDatabase();
                  },
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.paintbrush),
                    title: Text(
                      'Remove Database',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.UNIT),
                  child: ListTile(
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 16),
                    leading: Icon(CupertinoIcons.gear),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
