import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite/app/data/models/unit_model.dart';
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
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: DrawerCustom(),
      body: Container(
        // padding: EdgeInsets.only(
        //   top: 16,
        //   left: 16,
        //   right: 16,
        // ),
        child: Column(
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
                      '${controller.unitsTemp.length} units',
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
                          itemCount: controller.unitsTemp.length,
                          itemBuilder: (context, index) {
                            Unit unit = controller.unitsTemp[index];
                            return GestureDetector(
                              onTap: () {
                                controller.unit.value = unit;
                                controller.autoFill();
                                _showFormBottomSheet(context);
                              },
                              child: ListTile(
                                shape: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                                title: Text('${unit.name}'),
                                trailing: GestureDetector(
                                  onTap: () {
                                    Get.dialog(
                                      Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: ListView(
                                          padding: EdgeInsets.all(16),
                                          shrinkWrap: true,
                                          controller: ScrollController(),
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Konfirmasi',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Icon(
                                                    CupertinoIcons.clear,
                                                    color: Colors.red,
                                                    size: 18,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Text(
                                                'Data ini akan dihapus secara permanen.'),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Row(
                                              children: [
                                                Spacer(),
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Text(
                                                    'Batal',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 16,
                                                ),
                                                GestureDetector(
                                                  onTap: () =>
                                                      controller.removeData(
                                                    int.parse('${unit.id}'),
                                                  ),
                                                  child: Text(
                                                    'Hapus',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    CupertinoIcons.trash,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            )
          ],
        ),
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
                      'New Unit',
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
