import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/unit_model.dart';
import 'package:flutter_sqflite/app/modules/unit/views/unit_item.dart';
import 'package:flutter_sqflite/app/widgets/drawer_custom.dart';

import 'package:get/get.dart';

import '../controllers/unit_controller.dart';

class UnitView extends GetView<UnitController> {
  const UnitView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Units',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                controller.isNew.value = true;
                controller.clearInput();
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
        centerTitle: true,
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
                    '${controller.units.length} units',
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
            child: Container(
              child: Obx(
                () => controller.units.isEmpty
                    ? Center(
                        child: Text('No data available!'),
                      )
                    : ListView.builder(
                        itemCount: controller.units.length,
                        itemBuilder: (context, index) {
                          Unit unit = controller.units[index];
                          return GestureDetector(
                            onTap: () {
                              controller.isNew.value = false;
                              controller.unit.value = unit;
                              controller.autoFill();
                              _showFormBottomSheet(context);
                            },
                            child: UnitItem(
                              unit: unit,
                              controller: controller,
                            ),
                          );
                        },
                      ),
              ),
            ),
          )
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
                      '${controller.isNew.value == true ? 'New Unit' : 'Edit Unit'}',
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
                                'Unit Name',
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
                                  if (value == '') return 'Enter Unit Name';
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter Unit Name',
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
                                    Unit(name: controller.txtName.text),
                                  );
                                } else {
                                  controller.updateData(
                                    Unit(
                                      id: controller.unit.value.id,
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
